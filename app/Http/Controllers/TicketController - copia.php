<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Ticket;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use App\Http\Requests\TicketRequest;
use App\Models\Equipos;
use App\Models\estado_equipo;
use App\Models\personal_especialidad;
use App\Models\Tecnico;
use Coderflex\LaravelTicket\Models\Label;
use Illuminate\Database\Eloquent\Builder;
use Coderflex\LaravelTicket\Models\Category;
use App\Notifications\AssignedTicketNotification;
use App\Notifications\NewTicketCreatedNotification;
use PhpParser\Node\Expr\BinaryOp\Equal;
use Barryvdh\DomPDF\Facade\Pdf;
// use Illuminate\Support\Facades\DB;

class TicketController extends Controller
{
    public function index(Request $request): View
    {
        
        $tickets = Ticket::with('user', 'categories', 'labels', 'assignedToUser')
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
                return $query->whereDepartamento($request->input('departamento'));
            })
            ->when($request->has('fecha_atencion'), function (Builder $query) use ($request) {
                $fechaAtencion = \Carbon\Carbon::createFromFormat('Y-m-d', $request->input('fecha_atencion'))->startOfDay();
                return $query->whereDate('fecha_soporte', $fechaAtencion);
            })
            ->when(auth()->user()->hasRole('agent'), function (Builder $query) {
                $query->where('user_id', auth()->user()->id);
            })
            ->when(auth()->user()->hasRole('user'), function (Builder $query) {
                $query->where('user_id', auth()->user()->id);
            })
            ->when(auth()->user()->hasRole('admin'), function (Builder $query) {
                $query->where('user_id', auth()->user()->id);
            })
            ->orderByRaw("FIELD(priority, 'alto') DESC")
            ->orderByRaw("FIELD(status, 'cerrado') ASC")
            ->orderBy('created_at', 'desc')
            ->latest()
            ->paginate();
        return view('tickets.index', compact('tickets'));
    }

    public function create(): View
    {
        $labels = Label::visible()->pluck('name', 'id');

        $categories = Category::visible()->pluck('name', 'id');

        $users = User::role('agent')->orderBy('name')->pluck('name', 'id');

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
            'id_tickets' => $ticket->id, // Store the generated ticket ID
        ]);

        return to_route('tickets.show', $ticket);
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
        $estados = estado_equipo::where('id_tickets', $ticket->id)->first();

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
}
