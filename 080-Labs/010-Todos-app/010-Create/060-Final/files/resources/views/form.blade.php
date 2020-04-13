@extends('master')

@section('content')

  {{-- Display the name of the connected user --}}
  <div class="panel-heading">Hi {{ Auth::user()->name }}, please add your new Todo below</div>  

  <div class="panel-body">   

    {{-- 
      Messages sent by the controller like in
        return view('...')->with('message', '<div class="...">success</div>'))
      will be displayed here
    --}}
    @if(Session::has('message'))
      {!! Session::get('message') !!}
    @endif

    {{--
      The method will be 'POST' unless when $data is set.
      Not set : we're creating a new record so the HTTP method will be POST
      Set     : we're editing an existing record so the HTTP method will be PUT
    --}}
    {!! Form::open(['route' => 'storeTodo', 'method' => (isset($data) ? 'PUT' : 'POST')]) !!}

      {{--
        If we're editing an existing record, we'll need his ID in our controller.
        If we're creating a new record, we don't have yet an ID => 0
      --}}
      {!! Form::hidden('id', $data->id ?? 0) !!}

      <div class="form-group {!! $errors->has('todo') ? 'has-error' : '' !!}"> 
        {{--
          Output the "Title" entry.
        --}}
        {!! Form::text('title', $data->title ?? '', array('size' => '100', 'class' => 'form-control', 'placeholder' => 'Enter Todo\'s title')) !!}
        {!! $errors->first('title', '<div class="alert alert-danger">:message</div>') !!}
      </div>

      <div class="form-group">
        {{--
          Output the "Completed" flag.
        --}}      
        {!! Form::checkbox('completed', 1, (isset($data) ? ($data->completed==1) : 0))  !!}
        {!! Form::label('completed', 'Completed'); !!}
      </div>

      <div class="form-group {!! $errors->has('todo') ? 'has-error' : '' !!}">
        {{--
          Output the "Description" textarea.
        --}}      
        {!! Form::label('description', 'Description (optional)'); !!}
        {!! Form::textarea('description', $data->description ?? '', array('class' => 'form-control')) !!}
      </div>

      {{--
        Output the submit button
      --}}      
      {!! Form::submit('Submit !') !!}
    {!! Form::close() !!}
  </div>
@endsection

@section('navigation')
  <a href="/">Show all</a>
@endsection
