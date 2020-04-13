# Final code

Here is the final code of this second lab: [todos.zip](%URL%files/todos.zip)

<!-- concat-md::toc -->

## Install a fresh copy

1.  Start a DOS prompt
2.  Make sure Laravel is correctly install: type `Laravel -V`, if you see the Laravel Installer's version number (f.i. 2.0.1), it's fine.
3.  Install a fresh Laravel website: go to your public_html folder (i.e. where you wish create your website, can be `c:\development\my_sites` too if configured like this on your machine).
4.  At the prompt level, run `laravel new a_folder_name` (f.i. `laravel new app_todos`)
5.  Once the installation is done, go in that folder: type `cd app_todos` (i.e. your folder)
6.  Grab a copy of [todos.zip](%URL%files/todos.zip) and unzip the file (under DOS `"C:\Program Files\7-Zip\7z.exe" x todos.zip -aoa` i.e. extract with full path and overwrite existing files)
7.  Retrieve the name of the database to create:
    1.  Open with a text editor the file called `.env` present in the root of `app_todos`
    2.  Look to the `DB_DATABASE` variable, you'll find the name of the database for the application (by default, it'll be `todos`)
8.  Create a database with that name (`todos`) in your mySQL
    1.  At the prompt level, type `mysql -u root -p` (where root is the username)
    2.  When asking the password, just press enter (there is no password)
    3.  In the MySQL prompt, type `CREATE DATABASE todos;` and press Enter
    4.  Type `quit` for leaving MySQL
9.  Start the migration: `php artisan migrate:install`
10. Create tables: `php artisan migrate:fresh`
11. Add the authentication layer: `php artisan make:auth`
12. Add fake data: `php artisan todos:populate`
13. Run `composer require "laravelcollective/html"`
14. Install `composer require rap2hpoutre/laravel-log-viewer --dev`
15. This done, start artisan by starting `php artisan serve` on the DOS prompt.
16. With your browser go to `http://127.0.0.1:8000/login` and make a login with `christophe@todos.com` for the email while `admin` is the password.
17. Then we can use the application: `http://127.0.0.1:8000`

## Code source

### .env

Our environment file.

```php
%INCLUDE files/.env%
```

### app

#### app/Todo.php

Our model, layer for our `todos` table.qsdnfqsdhnf

```php
%INCLUDE files/app/Todo.php%
```

#### app/Console/Commands/clear.php

Our artisan command for clear tables

```php
%INCLUDE files/app/Console/Commands/clear.php%
```

#### app/Console/Commands/populate.php

Our artisan command for populating tables

```php
%INCLUDE files/app/Console/Commands/populate.php%
```

#### app/Events/TodoCreated.php

File that declare our `TodoCreated` own event.

```php
%INCLUDE files/app/Events/TodoCreated.php%
```

#### app/Http/Controllers/TodoController.php

Implements the code to run for each route.

```php
%INCLUDE files/app/Http/Controllers/TodoController.php%
```

#### app/Http/Requests/TodoRequest.php

Define who can use our Todo records and specify which rules should be applied to records.

```php
%INCLUDE files/app/Http/Requests/TodoRequest.php%
```

#### app/Listeners/LoginSuccess.php

Add in the Session a message "Hi {{ user }}, nice to see you again"

```php
%INCLUDE files/app/Listeners/LoginSuccess.php%
```

#### app/Listeners/LoginSuccessMilk.php

Add in the Session a message "Don't forget to buy some milk 🥛"

```php
%INCLUDE files/app/Listeners/LoginSuccessMilk.php%
```

#### app/Providers/AppServiceProvider.php

Since we need to bind our interface and our repository.

```php
%INCLUDE files/app/Providers/AppServiceProvider.php%
```

#### app/Providers/EventServiceProvider.php

This file will inform Laravel about which events are listened and who'll answer to calls.

```php
%INCLUDE files/app/Providers/EventServiceProvider.php%
```

#### app/Repositories/TodoRepositoryInterface.php

Defines the functions that are supported by the TodoRepository i.e. the data logic.

```php
%INCLUDE files/app/Repositories/TodoRepositoryInterface.php%
```

#### app/Repositories/TodoRepository.php

Implements functions for our data logic.

```php
%INCLUDE files/app/Repositories/TodoRepository.php%
```

### database

#### database/migrations/create_todos_table.php

Define the structure of the `todos` table.

```php
%INCLUDE files/database/migrations/2018_08_01_000000_create_todos_table.php%
```

### public

#### public/images/errors/error_404_data.json

The JSON file that will be used by the 404 error page (`Lottie`)

```json
%INCLUDE files/public/images/errors/error_404_data.json%
```

### resources

#### resources/views/create.blade.php

The form for adding a new todo.

```php
%INCLUDE files/resources/views/create.blade.php%
```

#### resources/views/edit.blade.php

The form for the edition of an existing todo.

```php
%INCLUDE files/resources/views/edit.blade.php%
```

#### resources/views/index.blade.php

Display the list of todos, like in a blog.

```php
%INCLUDE files/resources/views/index.blade.php%
```

#### resources/views/master.blade.php

Our page's master. Defines how pages should looks like.

```php
%INCLUDE files/resources/views/master.blade.php%
```

#### resources/views/show.blade.php

Show the detail of a todo. If a valid user is logged-in, display action's buttons.

```php
%INCLUDE files/resources/views/show.blade.php%
```

#### resources/views/errors/404.blade.php

The 404 error page.

```php
%INCLUDE files/resources/views/errors/404.blade.php%
```

#### resources/views/buttons/add.blade.php

Add a new item button.

```php
%INCLUDE files/resources/views/buttons/add.blade.php%
```

#### resources/views/buttons/back.blade.php

Go back button.

```php
%INCLUDE files/resources/views/buttons/back.blade.php%
```

#### resources/views/buttons/delete.blade.php

Delete an item button.

```php
%INCLUDE files/resources/views/buttons/delete.blade.php%
```

#### resources/views/buttons/edit.blade.php

Edit an existing item button.

```php
%INCLUDE files/resources/views/buttons/edit.blade.php%
```

#### resources/views/buttons/show.blade.php

Show button, go to the detail page.

```php
%INCLUDE files/resources/views/buttons/show.blade.php%
```

### routes

#### routes/web.php

Definition of our routes and how to manage them.

```php
%INCLUDE files/routes/web.php%
```

### tests

#### tests/Feature/TodoControllerTest.php

Our automated PHPUnit tests scenario.

```php
%INCLUDE files/tests/Feature/TodoControllerTest.php%
```
