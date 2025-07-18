<?php

namespace App\Enums;

enum Status: string
{
    case ABIERTO = 'abierto';
    case CERRADO = 'cerrado';
    case ARCHIVADO = 'archivado';
}
