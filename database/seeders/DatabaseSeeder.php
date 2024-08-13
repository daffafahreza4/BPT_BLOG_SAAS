<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Setting::factory()->create();
        \App\Models\User::factory()->create();
        \App\Models\Category::factory()->create();
        \App\Models\Post::factory()->create();
        \App\Models\Page::factory()->create();
        \App\Models\Tag::factory()->create();
    }
}
