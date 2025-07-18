<?php

namespace App\Http\Controllers;

use App\Models\Equipos;
use Illuminate\Http\Request;
use App\Models\Ticket;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;
use App\Services\ChartService;

class PDFController extends Controller
{
    public function generatePDFTicketsTecnico()
    {
        $datosTicketsPorTecnico = Ticket::select('assigned_to as user_id')
            ->selectRaw('COUNT(*) as total_tickets')
            ->selectRaw("SUM(CASE WHEN status = 'cerrado' THEN 1 ELSE 0 END) as total_cerrados")
            ->selectRaw("SUM(CASE WHEN status = 'abierto' THEN 1 ELSE 0 END) as total_abiertos")
            ->selectRaw("SUM(CASE WHEN status = 'archivado' THEN 1 ELSE 0 END) as total_archivados")
            ->join('model_has_roles', 'tickets.assigned_to', '=', 'model_has_roles.model_id')
            ->join('roles', function ($join) {
                $join->on('model_has_roles.role_id', '=', 'roles.id')
                    ->where('roles.name', 'agent');
            })
            ->with('user:id,name')
            ->groupBy('assigned_to')
            ->get();
            $tickets = Ticket::with('user', 'categories', 'labels', 'assignedToUser')
            ->latest();
            $pdf = PDF::loadView('report.tickets_tecnico', ['datosTicketsPorTecnico' => $datosTicketsPorTecnico,'tickets'=>$tickets]);

        return $pdf->download('ReporteTicketsTecnico.pdf');
    }
    public function generatePDFTicketsDepartamento()
    {
        $datosTicketsPorDepartamento = Ticket::select('departamento')
            ->selectRaw("SUM(CASE WHEN status = 'cerrado' THEN 1 ELSE 0 END) as total_cerrados")
            ->selectRaw("SUM(CASE WHEN status = 'abierto' THEN 1 ELSE 0 END) as total_abiertos")
            ->selectRaw("SUM(CASE WHEN status = 'archivado' THEN 1 ELSE 0 END) as total_archivados")
            ->selectRaw('COUNT(*) as total_tickets')
            ->groupBy('departamento')
            ->get();

        $pdf = PDF::loadView('report.tickets_departamento', ['datosTicketsPorDepartamento' => $datosTicketsPorDepartamento]);

        return $pdf->download('ReporteTicketsDepartamento.pdf');
    }
    public function generatePDFTicketsCategoria()
    {


        // Cargar la vista para el PDF

        $datosTicketsCategoria = DB::select(DB::raw("select count(*) as total_categoria,name as nombre_categoria from tickets inner join category_ticket on category_ticket.ticket_id = tickets.id inner join categories on categories.id = category_ticket.category_id group by name"));
        $datosTicketsCategoriaTorta = collect($datosTicketsCategoria)->mapWithKeys(function ($item) {
            return [$item->nombre_categoria => $item->total_categoria];
        })->all();

        $pdf = PDF::loadView('report.tickets_categoria', ['datosTicketsCategoria' => $datosTicketsCategoria, 'datosTicketsCategoriaTorta' => $datosTicketsCategoriaTorta]);

        return $pdf->download('ReporteTicketsCategoria.pdf');
    }

    public function generatePDFTicketsEquiposIncidencia()
    {
        $datosCantidadEquipos = Equipos::select('nombre_equipo', DB::raw('COUNT(*) as cantidad'))
            ->groupBy('nombre_equipo')
            ->get();
        
        $datosCantidadEquiposTorta = $datosCantidadEquipos->pluck('cantidad', 'nombre_equipo')->all();

        $pdf = PDF::loadView('report.tickets_equipos', ['datosCantidadEquipos' => $datosCantidadEquipos, 'datosCantidadEquiposTorta' => $datosCantidadEquiposTorta]);

        return $pdf->download('ReporteTicketsEquipos.pdf');
    }
    public function generatePDFTicketsEstado()
    {
        $datosTicketsEstado = Ticket::all();

        $pdf = PDF::loadView('report.tickets_estado', ['datosTicketsEstado' => $datosTicketsEstado]);

        return $pdf->download('ReporteTicketsEstado.pdf');
    }
    public function generatePDFTicketsFecha()
    {
        $datosTicketsFecha = Ticket::all();

        $pdf = PDF::loadView('report.tickets_fecha', ['datosTicketsFecha' => $datosTicketsFecha]);

        return $pdf->download('ReporteTicketsFecha.pdf');
    }
}
