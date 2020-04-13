# Adding navigation bar

<!-- concat-md::toc -->

## Create the navbar view

Create `/resources/views/navbar.blade.php` with this content:

```html
<nav class="navbar sticky-top navbar-light" style="background-color: #e3f2fd;">
	<ul class="nav navbar-nav navbar-right">
@guest
		<li><a href="/login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
@else
  		<li><a href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
@endauth
	</ul>
</nav>
```

The use of the `@guest` directive makes things easy: when no user is connected, display a `Login` link otherwise, display a logout link.

Note: We can also use `@auth ... @else ... @endauth`, just the opposite approach.

## Include navbar in master

Edit `/resources/views/master.blade.php` and include the navbar:

```html
<body>
  @include('navbar')
  <main role="main">
```

We've put the navbar just after the `<body>` tag. The complete code for `master.blade.php` with Bootstrap 4 and FontAwesome 5:

```html
<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  {{--
    Important for our Ajax requests: we need to protect our server's requests
    with the generated session token
  --}}
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Some stupid Todos application</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <style>
    textarea { max-height:150px; }
  </style>
</head>
<body>
  @include('navbar')
  <main role="main">  
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-3">Some stupid Todos application</h1>
        <small>A simple Laravel application, learning purposes</small>
      </div>
    </div>
  </main>
  <div class="container">
    @yield('content')
    <hr/>
    @yield('navigation')
  </div>
  @yield('script')
</body>
</html>
```
