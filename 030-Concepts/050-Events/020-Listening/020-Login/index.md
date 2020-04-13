# Listening Login event

<!-- concat-md::toc -->

## Why ?

Once someone is making a login, we can:

- Wish to send him a notification,
- Write in a log that he logged in and at what time,
- Update his profile by setting a field to a given value,
- Make checks like
  - Does the user has xxxx (a folder, a file, ...)
  - Can he login if ...

## Attach a listener

Edit `/app/Providers/EventServiceProvider.php` and update the `$listen` property:

```php
protected $listen = [
	'App\Events\Event' => ['App\Listeners\EventListener'],
	'Illuminate\Auth\Events\Login' => ['App\Listeners\LoginSuccess']
];
```

We inform Laravel that, when the event `Illuminate\Auth\Events\Login` is fired, he should call `App\Listeners\LoginSuccess` i.e. file `/app/Listeners/LoginSuccess.php`.

The example here above adds a listener for the `login` event and the code is located in folder `/app/Listeners/LoginSuccess.php`.

## Create the listener

To create such file, there is an Artisan command:

```
php artisan make:listener LoginSuccess
```

Tip: we can immediately specify the name of the event to observe

```
php artisan make:listener LoginSuccess --event=Illuminate\Auth\Events\Login
```

The `/app/Listeners/LoginSuccess.php` file will be generated and will contains:

```php
<?php

namespace App\Listeners;

class LoginSuccess
{
	/**
	 * Create the event listener.
	 *
	 * @return void
	 */
	public function __construct()
	{
	}

	/**
	 * Handle the event.
	 *
	 * @param  object $event
	 * @return void
	 */
	public function handle($event)
	{
	}
}
```

To do something when an event is raised, we just need to add our code to the `handle()` function. Here, since our event is attached to the Login feature, we can better typecast the parameter; not just `$event` but it's a login:

```php
use Illuminate\Auth\Events\Login;

public function handle(Login $login)
{
	Session::flash('message', 'Hi ' . $login->user->name . ', nice to see you again');
}
```

The idea is just to retrieve the username and store in the `message` Session variable a `Hi Christophe, nice to see you again` sentence (or anything else).

## Display our message

When the login has been made, Laravel will, by default, display the `home` view i.e. `/resources/views/home.blade.php` so, if we want to display the message, we'll add this directive in the file:

```
@if(Session::has('message'))
  <p class="alert alert-success">{{ Session::get('message') }}</p>
@endif
```

## Test Login events

Just go to your `http://127.0.0.1:8000/login` page.

![login](./images/login.png)

Fill in your credentials and you should see

![message](./images/message.png)

## Code improvement

The code that is proposed here above has a problem: if we've a second, a third, ... listener where a message is stored in the `message` Session, the last fired listener will crush what the others have done.

The first listener will have:

```php
Session::flash('message', 'Hi ' . $login->user->name . ', nice to see you again');
```

And a second:

```php
Session::flash('message', 'Don\'t forget to buy some milk 🥛');
```

So the message will be _Don't forget to buy some milk 🥛_ and no more _Hi Christophe_.

Writing event-driven-software implies that you never know how many listeners you've.

Refactored, we'll have:

- Listener 1:

```php
$arr = Session::get('message');
$arr[] = [
	'type' => 'success',
	'message' => 'Hi ' . $login->user->name . ', nice to see you again'
];
Session::flash('message', $arr);
```

- Listener 2:

```php
$arr = Session::get('message');
$arr[] = [
	'type' => 'warning',
	'message' => 'Don\'t forget to buy some milk 🥛'
];
Session::flash('message', $arr);
```

And our display:

```html
@section('content')

<?php

  if (Session::has('message')) {
  	$alert = '<div class="alert alert-%s alert-dismissible ' .
	  'fade show" role="alert">%s' .
	  '<button type="button" class="close" data-dismiss="alert" ' .
	  'aria-label="Close"><span aria-hidden="true">&times;</span> ' .
	  '</button></div>';

  	foreach (Session::get('message') as $msg) {
  		echo sprintf($alert, $msg['type'], $msg['message']);
  	}
  }

?>

[...]

@endsection
```

The output will then display as many information we've in our Session:

![](./images/hi_milk.png)
