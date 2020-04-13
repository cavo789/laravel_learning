# Macros

<!-- concat-md::toc -->

> https://openclassrooms.com/fr/courses/3613341-decouvrez-le-framework-php-laravel/3619068-des-vues-propres-1-2#/id/r-3619045

## Introduction

When working with a framework like Bootstrap f.i., we'll have a lot of views that will contains Bootstrap styles, how to display a button, create an accordion, ...

If the framework evolves and changes its way of doing such things, we'll need to change a lot of views.

The idea behind `macros` is to use a "word" and replace that word at runtime by something else.

For instance, here is the code for displaying a text input in a Bootstrap form:

```php
<div class="form-group {!! $errors->has('titre') ? 'has-error' : '' !!}">
	{!! Form::text('titre', null, ['class' => 'form-control', 'placeholder' => 'Titre']) !!}
	{!! $errors->first('titre', '<small class="help-block">:message</small>') !!}
</div>
```

With a macro, we'll be able to have:

```php
{!! Form::control('text', $errors, 'titre', 'Titre') !!}
```

If we use such feature in all of our forms, then it's easy to migrate from Bootstrap 2 to 4 by just reviewing how `Form::control` works and use the new-of-way of making form's entries with the new version of the framework.

## Use macro for alerts

In two or more views, we've things like:

```html
<?php
  if (Session::has('message')) {
  	$alert = '<div class="alert alert-%s alert-dismissible ' .
	'fade show" role="alert">%s' .
	  '<button type="button" class="close" data-dismiss="alert" ' .
	  'aria-label="Close"><span aria-hidden="true">&times;</span> ' .
	  '</button></div>';

  	foreach (Session::get('message') as $msg) {
  		echo sprintf($alert, $msg['type'], $msg['message']);
  	}
  }
?>
```

We're too dependent on Bootstrap; with a newer version of Bootstrap perhaps the way of displaying an alert will be modified so we'll need to update more than one view.

We'll then create a `Html::alert` so we can call that macro in all views so, in case of change, we'll just need to update one location instead of all views using such feature.
