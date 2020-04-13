# Database

<!-- concat-md::toc -->

## Could not found driver

```
Illuminate\Database\QueryException  : could not find driver
[...]
Exception trace:

  1   PDOException::("could not find driver")
      [...]\Database\Connectors\Connector.php:68

  2   PDO::__construct("mysql:host=127.0.0.1;port=3306;dbname=app_test", "root", "", [])
      [...]\Database\Connectors\Connector.php:68
```

The error above occurs when the php_pdo_mysql extension isn't loaded.

In your php.ini (also phpForApache.ini if this file also exists), make sure the following extension is loaded (and not commented). Restart the webserver once updated.

```ini
extension=php_pdo_mysql.dll
```

Note: the extension `php_mysqli` can be commented.

## SQL error when migrating tables

> https://www.developpez.net/forums/d1634622/php/bibliotheques-frameworks/laravel/erreur-migrations-laravel/

```
Illuminate\Database\QueryException : SQLSTATE[42000]: Syntax error or access
violation: 1071 Specified key was too long; max key length is 767 bytes
(SQL: alter table users add unique users_email_unique(email))
```

This error seems to be linked to Laravel 5.4.0; see this [issue #17508](https://github.com/laravel/framework/issues/17508)

To solve it, edit the file `/app/Providers/AppServiceProvider.php` ,

1.  Add `use Illuminate\Support\Facades\Schema;` on the top of the file
2.  In the `boot()` function add `Schema::defaultStringLength(191);`

File should be:

```php
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
	/**
	 * Bootstrap any application services.
	 *
	 * @return void
	 */
	public function boot()
	{
		Schema::defaultStringLength(191);
	}

	/**
	 * Register any application services.
	 *
	 * @return void
	 */
	public function register()
	{
	}
}
```

## The action is unauthorized

```
Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException
This action is unauthorized.
```

Most probably you're submitting a request and the `authorize()` function has returned false.

For instance

```php
<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TodoRequest extends FormRequest
{
	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize()
	{
		return false;
	}

}
```
