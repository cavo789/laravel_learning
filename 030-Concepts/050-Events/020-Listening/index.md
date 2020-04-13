# Listening events

> https://laravel.com/api/5.6/Illuminate/Auth/Events/Login.html

<!-- concat-md::toc -->

## Listeners

Laravel use a Provider for knowing who is listening events.

Check the file `/app/Providers/EventServiceProvider.php`:

```php
<?php

namespace App\Providers;

use Illuminate\Support\Facades\Event;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
	/**
	 * The event listener mappings for the application.
	 *
	 * @var array
	 */
	protected $listen = [
		'App\Events\Event' => ['App\Listeners\EventListener'],
	];

	/**
	 * Register any events for your application.
	 *
	 * @return void
	 */
	public function boot()
	{
		parent::boot();
	}
}
```

For adding a listener, we just need to add our listener in `$listen` so Laravel can manage _who is listening which event_.

We'll need to extend the `$listen` array and provide to information's:

1.  The namespace of the _listened_ event. If we want to listen to the Login event, the name is `Illuminate\Auth\Events\Login` (defined in `/vendor/laravel/framework/src/Illuminate/Auth/Events/Login.php`)
2.  The namespace of the _listener_. Since the default location is folder `/app/Listeners` the listener can be `/app/Listeners/MyListeningClass`.

For instance:

```php
protected $listen = [
	'App\Events\Event' => ['App\Listeners\EventListener'],
	'Illuminate\Auth\Events\Login' => ['App\Listeners\LoginSuccess']
];
```

## A few examples

%INCLUDE 1. Queries/index.md%

%INCLUDE 2. Login/index.md%
