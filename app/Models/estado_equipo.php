<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class estado_equipo extends Model
{
    use HasFactory;
    protected $table = "estado_equipo";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable = [
        'id',
        'id_equipo',
        'id_tickets',
        'estado',
        'ubicacion',
        'created_at',
        'updated_at',
    ];
}
