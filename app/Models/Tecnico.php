<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tecnico extends Model
{
    use HasFactory;
    protected $table = "tecnico";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable = [
        'id',
        'especialidad',
        'caracteristica',
        'created_at',
        'updated_at',
    ];
}
