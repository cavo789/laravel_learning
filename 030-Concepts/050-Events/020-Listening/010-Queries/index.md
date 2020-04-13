# Queries

Each time a query is fired, an event is triggered with the SQL statement of the query just ran against the database.

We can catch this for, f.i., displaying the list of queries during our optimization process:

## Spy the list of fired queries

A very fast way is to add this function in our `/app/routes.php` file. Just add this bloc:

```php
if (env('APP_DEBUG', false)) {
	DB::listen(function ($query) {
		echo '<pre style="background-color:yellow;' .
		'font-size:x-small;">' .
		'Query fired ' .
		'"' . $query->sql . '" ' .
		'<small>(' . __FILE__ . ' - ' . __LINE__ . ')</small>' .
		'</pre>';
	});
}
```

This will output the list of queries when `APP_DEBUG` is set.

![Listen queries](./images/listen_queries.png)
