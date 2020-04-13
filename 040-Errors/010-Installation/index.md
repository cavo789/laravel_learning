# Installation errors

<!-- concat-md::toc -->

## Error creating resource

```
Error creating resource: [message] fopen(http://cabinet.laravel.com/latest.zip): failed to open stream: Unable to find the socket transport "http" - did you forget to enable it when you configured PHP?
```

That error occurs when the `php.ini` file contains one of the following line with a comment so check the file (be sure to edit the correct one depending on the used version of PHP) and uncomment the line if needed. Don't forget to restart Apache if needed.

Edit your `php.ini` (also check `phpForApache.ini`), make sure that these lines are uncommented:

```ini
extension=php_curl.dll
extension=php_openssl.dll
```

## xxx requires ext-mbstring

```
xxx requires ext-mbstring * -> the requested PHP extension mbstring is missing from your system.
```

This error occurs when `php_mbstring` isn't loaded so uncomment the following line in your `php.ini`:

```ini
extension=php_mbstring.dll
```
