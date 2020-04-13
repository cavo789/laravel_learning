# Tips

<!-- concat-md::toc -->

## General

### Get installed Laravel version

To retrieve the current version of Laravel:

```
php artisan --version
```

This will display f.i. `Laravel Framework 5.6.29`

### Update Laravel framework

```
composer update
```

## IDE

### Add autocompletion support for Facades

> https://laracasts.com/series/how-to-be-awesome-in-phpstorm/episodes/15

In the editor, by typing `DB::` we're expecting that the IDE display the list of methods for that facade.

If not, first make sure that you've include it: add `use DB;` line to the top of your document. Try again to type `DB::`; if there is still no autocompletion, then use [Laravel 5 IDE Helper Generator](https://github.com/barryvdh/laravel-ide-helper).

Run these commands:

```
composer require barryvdh/laravel-ide-helper --dev
php artisan clear-compiled
php artisan ide-helper:generate
```

The last one is responsible for adding a file called `_ide_helper.php` in your application root folder. That file make autocompletion possible. Just restart the IDE.

_Note: the file isn't needed as part of your repository so you can ignore it in your `.gitignore` file._

## Authentication

### Simple Authentication

> https://code.tutsplus.com/tutorials/25-laravel-tips-and-tricks--pre-92818, #7
>
> Laravel takes a dead-simple approach to authentication. Simply pass an array of credentials, likely fetched from a login form, to Auth::attempt(). If the provided values match what is stored in the users table, the user will instantly be logged in.

```php
$user = [
  'email' => 'email',
  'password' => 'password'
];

if (Auth::attempt($user))
{
  // user is now logged in!
  // Access user object with Auth::user()
}
```

### A way to login with any password while you are in development

> https://laravel-tricks.com/tricks/a-way-to-login-with-any-password-while-you-are-in-development

It is always painful to remember the password of the sample accounts and login with them while you are working on your project and test it. You can use this package to easily and securely login with any password without touching your code.

> https://github.com/imanghafoori1/laravel-anypass

```
composer require imanghafoori/laravel-anypass --dev
```

## Documentation

### Api

[Laravel API Documentation Generator](https://github.com/whoisryosuke/laravel-apidoc-generator) will scan all API routes of the project and will generate a documentation (`.md`) and can also generate a `.json` file to use with [Postman](https://www.getpostman.com/)
