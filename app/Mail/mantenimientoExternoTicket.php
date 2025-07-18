<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class mantenimientoExternoTicket extends Mailable
{
    use Queueable, SerializesModels;
    public $usuario;
    public $ticket;
    public $nombreTecnico;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($usuario, $ticket, $nombreTecnico)
    {
        $this->usuario = $usuario;

        $this->ticket = $ticket;
    
        $this->nombreTecnico = $nombreTecnico;
    }

    /**
     * Get the message envelope.
     *
     * @return \Illuminate\Mail\Mailables\Envelope
     */
    public function envelope()
    {
        return new Envelope(
            subject: 'Actualización de Ticket - Mantenimiento Externo',
        );
    }

    /**
     * Get the message content definition.
     *
     * @return \Illuminate\Mail\Mailables\Content
     */
    public function content()
    {
        return new Content(
            view: 'correo.mantenimientoExternoTicket',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array
     */
    public function attachments()
    {
        return [];
    }
}
