<?php

namespace Database\Seeders;

use App\Models\Label;
use Illuminate\Database\Seeder;

class LabelsSeeder extends Seeder
{
    public function run()
    {
        $labels = [
            "problema", "pregunta", "mejora",
        ];

        foreach ($labels as $label) {
            Label::create([
                'name' => $label,
            ]);
        }
    }
}
