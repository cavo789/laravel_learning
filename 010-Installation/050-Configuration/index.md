# Configuration

<!-- concat-md::toc -->

## Internationalization

Languages can be retrieved from [https://github.com/caouecs/Laravel-lang](https://github.com/caouecs/Laravel-lang).

Languages should be copied into the folder `/resources/lang`.

## Files

### .env

#### Database

The `.env` file in the root folder will contains configurations items like the datababase's credentials.

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```

#### email

```ini
MAIL_DRIVER=smtp
MAIL_HOST=smtp.xxxxx.com
MAIL_PORT=25
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```

#### Debugging

The `.env` file contains a constant called `APP_DEBUG`. By setting that variable to `true`, additional errors messages will be displayed.

By putting the application to the production environment, don't forget to set `APP_DEBUG` to `false`.

### .htaccess

The `.htaccess` file of Laravel is located under `/public/.htaccess` and contains, by default:

```
<IfModule mod_rewrite.c>
   <IfModule mod_negotiation.c>
      Options -MultiViews -Indexes
   </IfModule>

   RewriteEngine On

   # Handle Authorization Header
   RewriteCond %{HTTP:Authorization} .
   RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

   # Redirect Trailing Slashes If Not A Folder...
   RewriteCond %{REQUEST_FILENAME} !-d
   RewriteCond %{REQUEST_URI} (.+)/$
   RewriteRule ^ %1 [L,R=301]

   # Handle Front Controller...
   RewriteCond %{REQUEST_FILENAME} !-d
   RewriteCond %{REQUEST_FILENAME} !-f
   RewriteRule ^ index.php [L]
</IfModule>
```

## Folders

### public

The only one folder that needs to be accessible to the user through the web. That means that, without exceptions, all the rest (folders `app`, `bootstrap`, `config`, `database`, ...) shouldn't be accessible from the web.

The `public` folder is also the only one with a 755 `chmod`.

## Paths

### Override

It's possible to overwrite default paths like, f.i., the paths for the views.

By default, it's `/resources/views` but we can change it by using the method `Config::set()`

```
Config::set('view.paths', [base_path().'/my_own_view_path']);
```

### Set our own

We can create our one paths like one for images, documentations, ...

To respect the Laravel's framework, we just need to add a file in the `/config` folder, f.i. adding `/config/images.php`.

```php
<?php
return ['path' => 'uploads'];
```

The content is really straightforward: the return is an associative array (key->value).

When added, we can immediately use it:

```php
echo config('images.path');
```
