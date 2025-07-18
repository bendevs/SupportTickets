<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class personal_especialidad extends Model
{
    use HasFactory;
    protected $table = "personal_especialidad";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable = [
        'id',
        'id_especialidades',
        'id_users',
        'fecha_inicio',
        'fecha_fin',
        'created_at',
        'updated_at',
    ];
}
