<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Equipos extends Model
{
    use HasFactory;
    protected $table = "configuracion_equipo_nuevo";
    protected $primaryKey = "id";
    public $timestamps = true;
    protected $fillable = [
        'id',
        'id_usuario',
        'nombre_equipo',
        'tipo',
        'area_unidad',
        'estadoEquipo',
        'direccion_ip',
        'correo_institucional',
        'created_at',
        'updated_at',
    ];
}
