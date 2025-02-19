<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    public function run()
    {
        $products = [
            ['name' => 'Laptop', 'description' => 'Gaming Laptop', 'price' => 1500, 'stock' => 10],
            ['name' => 'Smartphone', 'description' => 'Android Phone', 'price' => 800, 'stock' => 20],
            ['name' => 'Headphones', 'description' => 'Noise-canceling', 'price' => 200, 'stock' => 15],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}
