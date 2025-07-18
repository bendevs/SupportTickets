<?php

namespace App\Http\Controllers;

use App\Models\Equipos;
use App\Models\estado_equipo;
use App\Models\Ticket;
use Spatie\Activitylog\Models\Activity;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class ActivityController extends Controller
{
    public function __invoke()
    {
        $activities = Activity::with('causer')->latest()->paginate();

        return view('activities.index', compact('activities'));
    }
    public function reporte()
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

        $datosTicketsPorDepartamento = Ticket::select('departamento')
            ->selectRaw("SUM(CASE WHEN status = 'cerrado' THEN 1 ELSE 0 END) as total_cerrados")
            ->selectRaw("SUM(CASE WHEN status = 'abierto' THEN 1 ELSE 0 END) as total_abiertos")
            ->selectRaw("SUM(CASE WHEN status = 'archivado' THEN 1 ELSE 0 END) as total_archivados")
            ->selectRaw('COUNT(*) as total_tickets')
            ->groupBy('departamento')
            ->get();

        $datosTicketsCategoria = DB::select(DB::raw("select count(*) as total_categoria,name as nombre_categoria from tickets inner join category_ticket on category_ticket.ticket_id = tickets.id inner join categories on categories.id = category_ticket.category_id group by name"));
        $datosCantidadEquipos = Equipos::select('nombre_equipo', DB::raw('COUNT(*) as cantidad'))
            ->groupBy('nombre_equipo')
            ->get();
        $contadorTickets = Ticket::select('title', 'id')
            ->selectRaw('COUNT(*) as count')
            ->groupBy('title', 'id')
            ->orderBy('count', 'desc')
            ->get();
            $tickets = Ticket::whereNotNull('created_at')->orderBy('created_at', 'desc')->get();
            $datosTicketsPrioridad = $tickets->sortBy(function ($ticket) {
                $priorityOrder = ['alto' => 1, 'normal' => 2, 'bajo' => 3];
                return $priorityOrder[$ticket->priority] ?? 4;
            })->where('status', 'abierto');
        // dd($tickets);
            
        return view('activities.report', compact('datosTicketsPorTecnico', 'datosTicketsPorDepartamento', 'datosTicketsCategoria', 'datosCantidadEquipos', 'contadorTickets', 'tickets', 'datosTicketsPrioridad'));
    }
    public function grafica()
    {
        $dataTicketsTecnicoTorta = [];
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

        $dataTicketsDepartamentoTorta = [];
        $datosTicketsPorDepartamento = Ticket::select('departamento')
            ->selectRaw('COUNT(*) as total_tickets')
            ->groupBy('departamento')
            ->get();

        $totalTickets = 0;
        foreach ($datosTicketsPorTecnico as $dataTecnico) {
            $dataTicketsTecnicoTorta[$dataTecnico->user->name] = $dataTecnico->total_tickets;
        }
        foreach ($datosTicketsPorDepartamento as $dataDepartamento) {
            $dataTicketsDepartamentoTorta[$dataDepartamento->departamento] = $dataDepartamento->total_tickets;
            $totalTickets += $dataDepartamento->total_tickets;
        }
        foreach ($dataTicketsDepartamentoTorta as $departamento => $total_tickets) {
            $dataTicketsDepartamentoTorta[$departamento] = ceil(round($total_tickets / $totalTickets, 2) * 100);
        }
        $datosTicketsCategoria = DB::select(DB::raw("select count(*) as total_categoria,name as nombre_categoria from tickets inner join category_ticket on category_ticket.ticket_id = tickets.id inner join categories on categories.id = category_ticket.category_id group by name"));
        $datosTicketsCategoriaTorta = collect($datosTicketsCategoria)->mapWithKeys(function ($item) {
            return [$item->nombre_categoria => $item->total_categoria];
        })->all();

  
        $datosEquipos = Equipos::select('nombre_equipo', DB::raw('COUNT(*) as total'))
            ->groupBy('nombre_equipo')
            ->get();

        $dataEquipos = [];
        foreach ($datosEquipos as $equipo) {
            $dataEquipos[] = [
            'nombre_equipo' => $equipo->nombre_equipo,
            'total' => $equipo->total
            ];
        }
        
        $mantenimientoExterior = estado_equipo::where('ubicacion', 'Mantenimiento en Exterior')->count();
        $mantenimientoInterior = estado_equipo::where('ubicacion', 'Mantenimiento en Interior')->count();
        $dataEquipos2[] = [
        'mantenimientoExterior' => $mantenimientoExterior,
        'mantenimientoInterior' => $mantenimientoInterior
        ];

        return view('activities.chart', compact('dataTicketsTecnicoTorta', 'dataTicketsDepartamentoTorta', 'datosTicketsCategoriaTorta', 'dataEquipos', 'dataEquipos2'));
    }
}
