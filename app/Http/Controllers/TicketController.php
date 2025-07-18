<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Ticket;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use App\Http\Requests\TicketRequest;
use App\Mail\archivadoTicket;
use App\Mail\cerradoTicket;
use App\Mail\crearTicket;
use App\Mail\mantenimientoExternoTicket;
use App\Mail\mantenimientoInternoTicket;
use App\Models\Equipos;
use App\Models\estado_equipo;
use App\Models\personal_especialidad;
use App\Models\TablaTicketValoracion;
use App\Models\Tecnico;
use Coderflex\LaravelTicket\Models\Label;
use Illuminate\Database\Eloquent\Builder;
use Coderflex\LaravelTicket\Models\Category;
use App\Notifications\AssignedTicketNotification;
use App\Notifications\NewTicketCreatedNotification;
use PhpParser\Node\Expr\BinaryOp\Equal;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Mail;

// use Illuminate\Support\Facades\DB;

class TicketController extends Controller
{
    public function index(Request $request): View
    {
        $idTecnico = User::where('name', $request->assignedToUser)->first();
        $query = Ticket::with('user', 'categories', 'labels', 'assignedToUser')
            ->when($request->has('status'), function (Builder $query) use ($request) {
                return $query->where('status', $request->input('status'));
            })
            ->when($request->has('priority'), function (Builder $query) use ($request) {
                return $query->withPriority($request->input('priority'));
            })
            ->when($request->has('category'), function (Builder $query) use ($request) {
                return $query->whereRelation('categories', 'id', $request->input('category'));
            })
            ->when($request->has('departamento'), function (Builder $query) use ($request) {
                return $query->where('departamento', $request->input('departamento'));
            })
            ->when($request->has('fecha_atencion'), function (Builder $query) use ($request) {
                $fechaAtencion = \Carbon\Carbon::createFromFormat('Y-m-d', $request->input('fecha_atencion'))->startOfDay();
                return $query->whereDate('fecha_soporte', $fechaAtencion);
            })
            ->when($request->has('assignedToUser'), function (Builder $query) use ($request, $idTecnico) {
                return $query->where('assigned_to', $idTecnico->id);
            });

        if (auth()->user()->hasRole('user')) {
            $query->where('user_id', auth()->id());
        }

        if (auth()->user()->hasRole('agent')) {
            $query->where('assigned_to', auth()->id())
                  ->orWhere('user_id', auth()->id());
        }

        

        $tickets = $query->where(function ($query) {
            $query->where('status', 'abierto')
                  ->orWhere(function ($query) {
                  $query->where('status', 'cerrado')
                    ->where('updated_at', '>=', now()->subDays(5));
                  });
            })
            ->orderByRaw("FIELD(priority, 'alto') DESC")
            ->orderBy('created_at', 'desc')
            ->paginate();

        $tecnicos = User::whereHas('roles', function ($query) {
            $query->whereIn('name', ['admin', 'agent']);
        })->get();

        $ticketsValoracion = TablaTicketValoracion::all();
        return view('tickets.index', compact('tickets', 'tecnicos', 'ticketsValoracion'));
    }
    public function create(): View
    {
        $labels = Label::visible()->pluck('name', 'id');

        $categories = Category::visible()->pluck('name', 'id');

        $users = User::role(['agent', 'admin'])->orderBy('name')->pluck('name', 'id');

        $allUsers = User::all();

        $equipos = Equipos::all();

        $personalEspecialidad = personal_especialidad::all();

        $tecnico = Tecnico::all();

        return view('tickets.create', compact('labels', 'categories', 'users','equipos', 'personalEspecialidad', 'tecnico', 'allUsers'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'categories' => 'required|array|min:1',
            'labels' => 'required|array|min:1',
        ], [
            'categories.required' => 'Seleccione al menos una categoría.',
            'categories.min' => 'Seleccione al menos una categoría.',
            'labels.required' => 'Seleccione al menos una categoría.',
            'labels.min' => 'Seleccione al menos una categoría.',
        ]);
        $equipo = Equipos::where('id', $request->input('equipo'))->first();
        if ($equipo->id_usuario != $request->input('assigned_to_user')) {
            return back()->with('error', 'El técnico asignado no es el dueño de la máquina.');
        }
        foreach ($request->categories as $categoria) {
            if ($categoria == 1) {
                $tecnico = personal_especialidad::inRandomOrder()->first();
            } elseif (in_array($categoria, [2, 3, 4, 5, 7, 11, 16, 17])) {
                $tecnico = personal_especialidad::inRandomOrder()
                    ->where('id_especialidades', 7)
                    ->first();
            } elseif ($categoria == 6) {
                $tecnico = personal_especialidad::inRandomOrder()
                ->where('id_especialidades', 8)
                ->first();
            } elseif (in_array($categoria, [8, 9, 14])) {
                $tecnico = personal_especialidad::inRandomOrder()
                    ->whereIn('id_especialidades', [9, 10])
                    ->first();
            } elseif (in_array($categoria, [10, 12, 13, 18])) {
                $tecnico = personal_especialidad::inRandomOrder()
                ->whereIn('id_especialidades', [6, 7, 8])
                ->first();
            } elseif ($categoria == 19) {
                $tecnico = personal_especialidad::inRandomOrder()
                ->whereIn('id_especialidades', 6)
                ->first();
            } elseif ($categoria == 20) {
                $tecnico = personal_especialidad::inRandomOrder()->first();
            } elseif ($categoria == 15) {
                $tecnico = personal_especialidad::inRandomOrder()
                ->where('id_especialidades', [6, 11])
                ->first();
            }
        }
        
        $departamento = Equipos::where('id', $request->input('equipo'))->first();
        $ticket = Ticket::create($request->only('title', 'message', 'priority') + [
            'departamento' => $departamento->area_unidad,
            'user_id' => auth()->id(),
            'fecha_soporte' => now(),
            'assigned_to' => $tecnico->id_users,
        ]);

        $ticket->syncCategories($request->input('categories'));

        $ticket->syncLabels($request->input('labels'));

        if ($request->has('attachments') && !is_null($request->input('attachments')[0])) {
              $ticket->addMediaFromDisk($file, 'public')->toMediaCollection('tickets_attachments');
            }
        
        if ($request->input('assigned_to')) {
            User::find($request->input('assigned_to'))->notify(new AssignedTicketNotification($ticket));
        }

        User::role('admin')->get()->each->notify(new NewTicketCreatedNotification($ticket));

        
        $estadoEquipo = estado_equipo::create([
            'id_equipo' => $request->input('equipo'),
            'estado' => 'en mantenimiento',
            'ubicacion' => 'Mantenimiento en establecimiento',
            'id_tickets' => $ticket->id,
        ]);
        
        $usuario = user::find($ticket->user_id);
        $nombreTecnico = user::find($ticket->assigned_to);

        Mail::to($usuario->email)
            ->cc($nombreTecnico->email)
            ->send(new crearTicket($usuario, $ticket, $nombreTecnico));
        
        // return to_route('tickets.show', $ticket);
        return to_route('tickets.index');
    }

    public function show(mixed $ticket): View
    {
        if (is_numeric($ticket)) {
            $ticket = Ticket::findOrFail($ticket);
        }

        $this->authorize('view', $ticket);

        $ticket->load(['media', 'messages' => fn ($query) => $query->latest()]);

        return view('tickets.show', compact('ticket'));
    }

    public function edit(Ticket $ticket)
    {
        
        $this->authorize('update', $ticket);
        
        $labels = Label::visible()->pluck('name', 'id');
        
        $categories = Category::visible()->pluck('name', 'id');
        
        $users = User::role('agent')->orderBy('name')->pluck('name', 'id');
        
        $estados = estado_equipo::where('id_tickets', $ticket->id)->first();
        
        $equipos = Equipos::all();

        return view('tickets.edit', compact('ticket', 'labels', 'categories', 'users', 'estados', 'equipos'));
        
    }

    public function update(TicketRequest $request, Ticket $ticket)
    {

        // dd($request);
        $this->authorize('update', $ticket);
        
        $ticket->update($request->only('title', 'message', 'status', 'priority', 'assigned_to','departamento','fecha_soporte'));
        
        $ticket->syncCategories($request->input('categories'));
        
        $ticket->syncLabels($request->input('labels'));
        
        if ($ticket->wasChanged('assigned_to')) {
            User::find($request->input('assigned_to'))->notify(new AssignedTicketNotification($ticket));
        }

        if (!is_null($request->input('attachments')[0])) {
            foreach ($request->input('attachments') as $file) {
                $ticket->addMediaFromDisk($file, 'public')->toMediaCollection('tickets_attachments');
            }
        }

        $labels = Label::visible()->pluck('name', 'id');

        $categories = Category::visible()->pluck('name', 'id');

        $users = User::role('agent')->orderBy('name')->pluck('name', 'id');
        if ($request->estados == 0) {
            $estadoEquipo = estado_equipo::create([
                'id_equipo' => $request->input('equipo'),
                'estado' => "en mantenimiento",
                'ubicacion' => "Mantenimiento en establecimiento",
                'id_tickets' => $ticket->id,
            ]);
        }
        else {    
            $estadoEquipo = estado_equipo::find($request->estados);
            if ($estadoEquipo) {
                $estadoEquipo->update([
                'estado' => $request->input('estado'),
                'ubicacion' => $request->input('ubicacion'),
                ]);
            }
        }
        $configuracionEquipo = Equipos::where('id', $estadoEquipo->id_equipo)->first();
        if ($configuracionEquipo) {
            if ($request->estado == 'en_mantenimiento') {
                $configuracionEquipo->estadoEquipo = 'En Mantenimiento';
            } elseif ($request->estado == 'arreglado') {
                $configuracionEquipo->estadoEquipo = 'Activo';
            } elseif ($request->estado == 'baja') {
                $configuracionEquipo->estadoEquipo = 'Inactivo';
            }
            $configuracionEquipo->save();
        }
        $estados = estado_equipo::where('id_tickets', $ticket->id)->first();
        $usuario = user::find($ticket->user_id);
        $nombreTecnico = user::find($ticket->assigned_to);
         if ($request->status == 'abierto') {
             if ($request->estado == 'en_mantenimiento') {
                 if ($request->ubicacion == 'Mantenimiento en establecimiento') {
                     mail::to($usuario->email)
                         ->cc($nombreTecnico->email)
                         ->send(new mantenimientoInternoTicket($usuario, $ticket, $nombreTecnico));
                 }else{
                     mail::to($usuario->email)
                         ->cc($nombreTecnico->email)
                         ->send(new mantenimientoExternoTicket($usuario, $ticket, $nombreTecnico));
                 }
             }
         }elseif ($request->status == 'cerrado') {
             mail::to($usuario->email)
                 ->cc($nombreTecnico->email)
                 ->send(new cerradoTicket($usuario, $ticket, $nombreTecnico));
         }elseif ($request->status == 'archivado') {
             mail::to($usuario->email)
                 ->cc($nombreTecnico->email)
                 ->send(new archivadoTicket($usuario, $ticket, $nombreTecnico));
         }
        return view('tickets.edit', compact('ticket', 'labels', 'categories', 'users', 'estados'));
    }

    public function destroy(Ticket $ticket)
    {
        $this->authorize('delete', $ticket);

        $ticket->delete();

        return to_route('tickets.index');
    }

    public function upload(Request $request)
    {
        $path = [];

        if ($request->file('attachments')) {
            foreach ($request->file('attachments') as $file) {
                $path = $file->store('tmp', 'public');
            }
        }

        return $path;
    }

    public function close(Ticket $ticket)
    {
        $this->authorize('update', $ticket);

        $ticket->close();

        return to_route('tickets.show', $ticket);
    }

    public function reopen(Ticket $ticket)
    {
        $this->authorize('update', $ticket);

        $ticket->reopen();

        return to_route('tickets.show', $ticket);
    }

    public function archive(Ticket $ticket)
    {
        $this->authorize('update', $ticket);

        $ticket->archive();

        return to_route('tickets.show', $ticket);
    }
    public function report(Ticket $ticket){
        // $user= User::find($ticket->user_id);
        // $estadoEquipo = estado_equipo::where('id_tickets', $ticket->id)->first();
        // $equipos = Equipos::where('id', $estadoEquipo->id_equipo)->first();
        
        $user = User::find($ticket->user_id);
        // dd($user);
        $estadoEquipo = estado_equipo::where('id_tickets', $ticket->id)->first();
        $personalEspecialidad = personal_especialidad::where('id_users', $ticket->assigned_to)->first();
        if ($estadoEquipo) {
            $labels = Label::visible()->pluck('name', 'id');
            $categories = Category::visible()->pluck('name', 'id');
            $userPersonal = User::find($personalEspecialidad->id_users);
            $equipos = Equipos::where('id', $estadoEquipo->id_equipo)->first();
            // dd($userPersonal);
            $pdf = Pdf::loadView('report.tickets_reporte', compact('ticket', 'user', 'estadoEquipo', 'equipos', 'personalEspecialidad', 'userPersonal', 'categories'));

            return $pdf->download('ticket_report.pdf');
        }
        else {
            return back()->with('error', 'Arregle este ticket ya que no tiene máquina designada.');
        }
    }

    public function clasificate(Request $request)
    {
        TablaTicketValoracion :: create([
            'NivelAtencion' => $request->input('rating'),
            'IdUsuario' => $request->input('IdUsuario'),
            'idTecnico' => $request->input('idTecnico'),
            'idTicket' => $request->input('idTicket'),
        ]);
        return back()->with('success', 'Ticket calificado correctamente.');
    }

    public function listaValoracion()
    {
        $usuarios = User::all();
        $ticketsValoracion = TablaTicketValoracion::select('idTecnico')
            ->selectRaw('SUM(CASE WHEN NivelAtencion = 1 THEN 1 ELSE 0 END) as excelente')
            ->selectRaw('SUM(CASE WHEN NivelAtencion = 2 THEN 1 ELSE 0 END) as bueno')
            ->selectRaw('SUM(CASE WHEN NivelAtencion = 3 THEN 1 ELSE 0 END) as regular')
            ->selectRaw('SUM(CASE WHEN NivelAtencion = 4 THEN 1 ELSE 0 END) as malo')
            ->groupBy('idTecnico')
            ->get();
        return view('tickets.listaValoracion', compact('ticketsValoracion', 'usuarios'));
    }
    public function fechasDeTickets(){
        // $tickets = Ticket::where('created_at', '>=', now()->startOfWeek())
        //     ->where('created_at', '<', now()->endOfWeek())
        //     ->get();
        // $usuarios = User::all();
        // $pdf = Pdf::loadView('report.fechasDeTickets', compact('tickets', 'usuarios'));
        // $filename = 'tickets_report_' . now()->format('d-m-Y') . '.pdf';
        // return $pdf->download($filename);
        // return view('tickets.fechasDeTickets', compact('tickets'));
        // dd($tickets);
        $usuarios = User::whereHas('roles', function ($query) {
            $query->where('name', 'admin');
        })->get();
        dd($usuarios);
        // $tickets = Ticket::where('created_at', '>=', now()->startOfWeek())
        //     ->where('created_at', '<', now()->endOfWeek())
        //     ->get();

        // $pdf = Pdf::loadView('report.fechasDeTickets', compact('tickets', 'usuarios'));
        // $filename = 'tickets_report_' . now()->format('d-m-Y') . '.pdf';
        // return $pdf->download($filename);
    }
}
