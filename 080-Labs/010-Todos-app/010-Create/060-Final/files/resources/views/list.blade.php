@extends('master')

@section('content')

  {{--
    $data is a collection of records
  --}}
  @isset($datas)
    {{--
      For each todo, we'll show his title in a H3
      Clicking on the title will display the todo's details
      We'll also show: todo's description and his author.
    --}}
    @foreach($datas as $data)
      <h3><a href="todo/{{ $data->id }}">{{ $data->title }}</a></h3>
      <p>{{ $data->description }}</p>
      <small>Author: {{ $data->user->name }}</small>
      <hr/>
    @endforeach
  @endisset
@endsection

@section('navigation')
  <a href="/todo" >Add new item</a>
@endsection
