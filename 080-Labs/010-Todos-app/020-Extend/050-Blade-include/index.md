# Blade include

Instead of creating our buttons in each view, use `@include` instead.

<!-- concat-md::toc -->

## Problem with show.blade.php

At this stage, the `show` view has this code:

```html
@section('navigation')
  @if(Illuminate\Support\Facades\Auth::check())
    <a href="javascript:history.back()" class="back btn btn-sm btn-success">
      <span class="glyphicon glyphicon-circle-arrow-left"></span> Back
    </a>
    <span class="buttons">
      <button class="btn btn-sm btn-primary edit">
        <i class="glyphicon glyphicon-edit"></i> Update
      </button>
      <button class="btn btn-sm btn-danger delete">
        <i class="glyphicon glyphicon-remove"></i> Delete
      </button>
    </span>
  @endif
@endsection
```

There are three links for `Back`, `Update` and `Delete`.

Since these buttons are also used in other views, we'll externalize them.

## Create a folder for buttons

Create the folder `/resources/views/buttons` and add these four views.

1.  `add.blade.php`

Add new item button.

```html
<button type="submit" class="btn btn-sm btn-primary"
  onclick="location.href='{{ route('todos.create') }}'">
  <i class="far fa-plus-square"></i> Add new item
</button>
```

2.  `back.blade.php`

Go back button.

```html
<a href="javascript:history.back()" class="back btn btn-sm btn-success">
	<i class="far fa-hand-point-left"></i> Back
</a>
```

3.  `delete.blade.php`

Delete button. Since we need to use the `DELETE` method, we need to create a form.

```html
{!! Form::open(['method' => 'DELETE', 'route' => ['todos.destroy', $data->id], 'style' => 'display:inline']) !!}

<button type="submit" class="btn btn-sm btn-danger delete" onclick="return confirm('Remove this record?')">
	<i class="far fa-trash-alt"></i> Delete
</button>

{!! Form::close() !!}
```

4.  `edit.blade.php`

Edit button, go to the edit form.

```html
<button type="submit" class="btn btn-sm btn-primary"
	onclick="location.href='{{ route('todos.edit', ['id' => $data->id]) }}'">
	<i class="far fa-edit"></i> Edit
</button>
```

4.  `show.blade.php`

Show button, display the detail page.

```html
<button type="submit" class="btn btn-sm btn-success"
	onclick="location.href='{{ route('todos.show', ['id' => $data->id]) }}'">
	<i class="far fa-eye"></i> Show
</button>
```

## Use buttons in existing views

Edit `/resources/views/show.blade.php` and replace:

```html
@section('navigation')
  @if(Illuminate\Support\Facades\Auth::check())
    <a href="javascript:history.back()" class="back btn btn-sm btn-success">
      <span class="glyphicon glyphicon-circle-arrow-left"></span> Back
    </a>
    <span class="buttons">
      <button class="btn btn-sm btn-primary edit">
        <i class="glyphicon glyphicon-edit"></i> Update
      </button>
      <button class="btn btn-sm btn-danger delete">
        <i class="glyphicon glyphicon-remove"></i> Delete
      </button>
    </span>
  @endif
@endsection
```

with

```html
@section('navigation')
  @include('buttons.back')
  @auth
    <span class="buttons">
      @include('buttons.edit')
      @include('buttons.delete')
    </span>
  @endauth
@endsection
```

This code is now simplier: include the `back` buttons and, if the user is logged-in, include also `edit` and `delete`.
