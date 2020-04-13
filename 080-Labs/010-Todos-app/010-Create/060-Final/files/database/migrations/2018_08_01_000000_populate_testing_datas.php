<?php

use Illuminate\Database\Migrations\Migration;

class PopulateTestingDatas extends Migration
{
	/**
	 * The migration is running
	 *
	 * @return void
	 */
	public function up()
	{
		// Create user Christophe
		DB::table('users')->insert([[
			'name' => 'Christophe',
			'email' => 'christophe@todos.com',
			'password' => bcrypt('admin')
		]]);

		// Getting the ID of the user Christophe
		$user_id = DB::table('users')->where('name', 'Christophe')->take(1)->value('id');

		// Use faker to get french dummy text
		// If needed, just run "composer require fzaninotto/faker" in
		// a DOS prompt
		$faker = Faker\Factory::create('fr_FR');

		// Insert a few items for him
		for ($i = 0; $i < 20; $i++) {
			DB::table('todos')->insert([
				[
					'title' => $faker->sentence($nbWords = 6, $variableNbWords = true) .
						' (todo #' . ($i + 1) . ')',
					'description' => $faker->realText($maxNbChars = 1000),
					'user_id' => $user_id,
					'completed' => $faker->boolean(),
					'created_at' => now(),
					'updated_at' => now()
				]
			]);
		}
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		// Getting the ID of the user Christophe
		$user_id = DB::table('users')->where('name', 'Christophe')->take(1)->value('id');

		// Delete todos added by him
		DB::table('todos')->where('user_id', $user_id)->delete();

		// And remove the user
		DB::table('users')->where('name', '=', 'Christophe')->delete();
	}
}
