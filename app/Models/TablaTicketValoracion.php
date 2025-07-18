<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TablaTicketValoracion extends Model
{
    use HasFactory;

    protected $table = 'TablaTicketValoracion';

    protected $fillable = [
        'NivelAtencion',
        'IdUsuario',
        'idTecnico',
        'idTicket',
        'descripcion',
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'IdUsuario');
    }

    public function tecnico()
    {
        return $this->belongsTo(User::class, 'idTecnico');
    }

    public function ticket()
    {
        return $this->belongsTo(Ticket::class, 'idTicket');
    }
}
