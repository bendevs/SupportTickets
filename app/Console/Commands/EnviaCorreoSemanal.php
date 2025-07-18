<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Ticket;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use App\Mail\ReporteSemanal;
use Barryvdh\DomPDF\Facade\Pdf;

class EnviaCorreoSemanal extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reporte:reporte-semanal';
    protected $description = 'Enviar un reporte semanal de tickets creados';

    public function __construct()
    {
        parent::__construct();
    }
    /**
     * The console command description.
     *
     * @var string
     */

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
            $tickets = Ticket::where('created_at', '>=', now()->startOfWeek())
                ->where('created_at', '<', now()->endOfWeek())
                ->get();
            $Admins = User::whereHas('roles', function ($query) {
                $query->where('name', 'admin');
            })->get();
            $usuarios = User::all();
            $pdf = Pdf::loadView('report.fechasDeTickets', compact('tickets', 'usuarios'));
            $filename = 'tickets_report_' . now()->format('d-m-Y') . '.pdf';
            $pdf->save(storage_path($filename));
            foreach($Admins as $admin){
                $data = [
                    'subject' => 'Registro de los Tickets Semanales (' . now()->format('d-m-Y') . ')',
                    'email' => $admin->email,
                ];
    
                Mail::send([], [], function ($message) use ($data, $filename) {
                    $message->from(env('MAIL_USERNAME'))
                            ->to($data['email'])
                            ->subject($data['subject'])
                            ->attach(storage_path($filename));
                });
            }

            $data = [
                'subject' => 'Registro de los Tickets Semanales (' . now()->format('d-m-Y') . ')',
                //Aqui debes colocar el correo institucional de la persona que recibira el reporte
                'email' => 'servel777@gmail.com',
            ];

            Mail::send([], [], function ($message) use ($data, $filename) {
                $message->from(env('MAIL_USERNAME'))
                        ->to($data['email'])
                        ->subject($data['subject'])
                        ->attach(storage_path($filename));
            });
            return 0;
    }
}
