---
title: Dusk
created_time: "2018-08-29 08:22:02"
language: fr
subtitle: ""
---

# Dusk

> https://github.com/laravel/dusk

> https://scotch.io/tutorials/introduction-to-laravel-dusk

Laravel Dusk was one of the new features introduced in Laravel 5.4. Dusk is a tool for application testing. `Dusk` will run tests in a browser while `PHPUnit` is making HTTP requests.

## Installation

Tutorial on Laravel : [https://laravel.com/docs/5.4/dusk](https://laravel.com/docs/5.4/dusk)

```
composer require --dev laravel/dusk
```

followed by

```
php artisan dusk:install
```

This will create the folder `/tests/Browser` in the folder's application.

Be sure to have the latest webdriver:

```
composer update facebook/webdriver
```

## Configuration

We need to make a copy of `.env` to `.env.dusk` and adapt `APP_ENV` to f.i. DUSK

Be sure to have the correct `APP_URL` URL like the one used in the browser.

## Command line

```
php artisan dusk "-vvv" "--debug" "--bootstrap" "D:/wamp64/www/function_descriptions/tests/bootstrap.php" "--configuration" "D:/wamp64/www/function_descriptions/tests/config/default.dusk.xml" "--filter" "%\btest_AddFunctionDescription\b%" "D:/wamp64/www/function_descriptions/tests/Browser/Tests/FunctionDescriptions/AddTest.php"
```
