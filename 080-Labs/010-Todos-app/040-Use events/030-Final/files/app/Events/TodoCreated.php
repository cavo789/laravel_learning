<?php

namespace App\Events;

use App\Todo;

class TodoCreated
{
	public $todo;

	/**
	 * Create a new event instance.
	 *
	 * @return void
	 */
	public function __construct(Todo $todo)
	{
		$this->todo = $todo;
	}
}
