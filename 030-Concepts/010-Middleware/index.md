# Middleware

> https://openclassrooms.com/fr/courses/3613341-decouvrez-le-framework-php-laravel/3616909-les-entrees#/id/r-3616818

<!-- concat-md::toc -->

A middleware defines the code to run by entering or leaving a request in a "context" (the middleware).

By default, two middlewares are defined: `web` and `api`.

We can f.i. define a new one called `admin` and thanks to this, perform a check 'can the current user use the admin part?': by opening `admin` a validation code will then be fired, automatically, on each admin request. This makes things easy.

## Location

The middleware is defined in the `/app/Http/Kernel.php` file:

```php
protected $middlewareGroups = [
  'web' => [
    \App\Http\Middleware\EncryptCookies::class,
    \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
    \Illuminate\Session\Middleware\StartSession::class,
    // \Illuminate\Session\Middleware\AuthenticateSession::class,
    \Illuminate\View\Middleware\ShareErrorsFromSession::class,
    \App\Http\Middleware\VerifyCsrfToken::class,
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
  ],
  'api' => [
    'throttle:60,1',
    'bindings',
  ],
];
```

We can see that, for `web`, cookies, session and the CSRF token f.i. will be loaded and not for `api`.

The `web` middleware is the default one: every single route defined in `/app/Http/routes.php`, if nothing is specified, are `web` routes.
