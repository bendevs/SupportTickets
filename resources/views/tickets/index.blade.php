<x-app-layout>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <x-slot name="header">
        {{ __('Tickets') }}
    </x-slot>
    @if(session('error'))
        <div id="error-message" class="bg-green-500 text-white px-4 py-3 rounded shadow-md" role="alert">
            <strong>{{ session('error') }}</strong>
        </div>

        <script>
            setTimeout(function() {
                var errorMessage = document.getElementById('error-message');
                if (errorMessage) {
                    errorMessage.style.display = 'none';
                }
            }, 5000);
        </script>
    @endif
<div class="block">
    <div class="mb-4 flex justify-between items-center">
        <a class="rounded-lg bg-purple-600 px-4 py-2 text-sm font-medium text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2" href="{{ route('tickets.create') }}">
            {{ __('Create') }}
        </a>
    </div>
    <table class="grid w-full table-fixed">
        <tr>
            <td class="w-1/5">
                <select class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="status" id="status" onchange="window.location.href=this.value">
                    <option value="{{ clearQueryString('status') }}" selected disabled>-- SELECCIONAR ESTADO --</option>
                    @foreach(\App\Enums\Status::cases() as $status)
                        <option value="{{ toggle('status', $status->value) }}" @selected($status->value == request('status'))>{{ $status->name }}</option>
                    @endforeach
                </select>
            </td>
            <td class="w-1/5">
                <select class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="priority" id="priority" onchange="window.location.href=this.value">
                    <option value="{{ clearQueryString('priority') }}" selected disabled>-- SELECCIONAR PRIORIDAD --</option>
                    @foreach(\App\Enums\Priority::cases() as $priority)
                        <option value="{{ toggle('priority', $priority->value) }}" @selected($priority->value == request('priority'))>{{ $priority->name }}</option>
                    @endforeach
                </select>
            </td>
            <td class="w-1/5">
                <select class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="category" id="category" onchange="window.location.href=this.value">
                    <option value="{{ clearQueryString('category') }}" selected disabled>-- SELECCIONAR CATEGORIA --</option>
                    @foreach(\App\Models\Category::pluck('name', 'id') as $id => $name)
                        <option value="{{ toggle('category', (string) $id) }}" @selected($id == request('category'))>{{ $name }}</option>
                    @endforeach
                </select>
            </td>
        </tr>
        <tr>
            <td class="w-1/5">
                <select class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="departamento" id="departamento" onchange="window.location.href=this.value">
                    <option value="{{ clearQueryString('departamento') }}" disabled selected>-- SELECCIONAR DEPARTAMENTO --</option>
                    @foreach(\App\Enums\Departamentos::cases() as $departamento)
                        <option value="{{ toggle('departamento', $departamento->value) }}" @selected($departamento->value == request('departamento'))>{{ $departamento->name }}</option>
                    @endforeach
                </select>
            </td>
            <td class="w-1/5">
                <div class="block">
                    <input type="date" id="fecha_atencion" name="fecha_atencion" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                        onchange="if(this.value === '{{ now()->format('Y-m-d') }}') { window.location.href = '{{ url('tickets') }}'; } else { window.location.href = '{{ url('tickets') }}?fecha_atencion=' + this.value; }">
                </div>
            </td>
            @role('admin')
            <td class="w-1/5">
                <select class="block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="tecnico" id="tecnico" onchange="window.location.href=this.value">
                    <option value="{{ clearQueryString('assignedToUser') }}" disabled selected>-- SELECCIONAR TECNICO --</option>
                    @foreach($tecnicos as $tecnico)
                        <option value="{{ toggle('assignedToUser', $tecnico->name) }}" @if(request('assignedToUser') == $tecnico->name) selected @endif>{{ $tecnico->name }}</option>
                    @endforeach
                </select>
            </td>
            @endrole
        </tr>
    </table>
    {{-- <select class="block rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="tecnico" id="tecnico" onchange="window.location.href=this.value">
        <option value="{{ clearQueryString('tecnico') }}" disabled selected>-- SELECCIONAR TECNICO --</option>
        @foreach($tecnicos as $tecnico)
        @if($tickets->contains('assignedToUser.name', $tecnico->name))
            <option value="{{ toggle('tecnico', (string) $tecnico->id) }}" @selected($tecnico->id == request('tecnico'))>{{ $tecnico->name }}</option>
        @endif
        @endforeach
    </select> --}}
</div>

    
    @role('admin')
        <div class="mt-4 mb-4 text-right">
            <form action="{{ route('search') }}" method="GET" class="flex">
                <button type="submit" class="rounded-l-lg bg-purple-600 px-4 py-2 text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2">Buscar</button>
                <input type="text" name="query" placeholder="Buscar comentarios..." class="rounded-r-lg border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 px-4 py-2" style="width: 45.5rem;">
            </form>
        </div>
    @endrole

    <div class="rounded-lg bg-white p-4 shadow-md">
        <div class="mb-9 w-full overflow-hidden rounded-lg border shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="min-w-full whitespace-no-wrap">
                    <thead>
                        <tr class="border-b bg-gray-50 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">
                            <th class="px-4 py-3">Titulo</th>
                            <th class="px-4 py-3">Autor</th>
                            <th class="px-4 py-3">Estado</th>
                            <th class="px-4 py-3">Prioridad</th>
                            <th class="px-4 py-3">Categoria</th>
                            <th class="px-4 py-3">Etiquetas</th>
                            <th class="px-4 py-3">Departamento</th>
                            <th class="px-4 py-3">
                                <div style="display: inline; color: black;">
                                    Fecha de Creación
                                </div>
                                /
                                <div style="display: inline; color: gray;">
                                    Fecha de Culminación
                                </div>
                            </th>
                            @hasanyrole('admin|agent|user')
                                <th class="px-4 py-3">Asignado a</th>
                            @endhasanyrole
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y">
                        @forelse($tickets as $ticket)
                        @if ($ticket->priority == "alto")
                            <tr class="text-gray-700" style="background-color: rgba(255, 0, 0, 0.5);">
                        @elseif ($ticket->priority == "normal")
                            <tr class="text-gray-700" style="background-color: rgba(255, 251, 0, 0.5);">
                        @elseif ($ticket->priority == "bajo")
                            <tr class="text-gray-700" style="background-color: rgba(0, 128, 0, 0.5);">
                        @endif
                                
                                <td class="px-4 py-3 text-sm">
                                    <div class="flex items-center">
                                        
                                        <a href="{{ route('tickets.edit', $ticket) }}" class="hover:underline">{{ $ticket->title }}</a>
                                    </div>
                                </td>

                                <td class="px-4 py-3 text-sm">
                                    {{ $ticket->user->name }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $ticket->status }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $ticket->priority }}
                                </td>
                                <td class="px-8 py-3 text-sm">
                                    @foreach($ticket->categories as $category)
                                        <span>{{ $category->name }}</span>
                                    @endforeach
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @foreach($ticket->labels as $label)
                                        <span>{{ $label->name }}</span>
                                    @endforeach
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $ticket->departamento }}
                                </td>
                                <td class="px-2 py-2 text-sm">
                                    @if ($ticket->status == "abierto")
                                        <div style="display: inline; color: black;">
                                            {{ $ticket->created_at }}
                                        </div>
                                    @elseif ($ticket->status == "cerrado")
                                        <div style="display: inline; color: gray;">
                                            {{ $ticket->updated_at }}
                                        </div>
                                    @endif
                                </td>
                                @hasanyrole('admin|agent|user')
                                    <td class="px-4 py-3 text-sm">
                                        {{ $ticket->assignedToUser->name ?? '' }}
                                    </td>
                                @endhasanyrole
                                <td class="px-3 py-3 space-x-2">
                                    <div class="flex space-x-2">
                                        @hasanyrole('admin|agent')
                                        @if($ticket->status === 'cerrado')
                                            <a class="rounded-lg bg-gray-400 px-4 py-2 text-xs font-medium text-white transition duration-150 cursor-not-allowed">
                                                {{ __('Edit') }}
                                            </a>
                                        @else
                                            <a class="rounded-lg bg-purple-600 px-4 py-2 text-xs font-medium text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2" href="{{ route('tickets.edit', $ticket) }}">
                                                {{ __('Edit') }}
                                            </a>
                                        @endif
                                        @endhasanyrole

                                        @role('admin')
                                            {{-- <form action="{{ route('tickets.destroy', $ticket) }}" method="POST" onsubmit="return confirm('Esta seguro en eliminar?')" style="display: inline-block;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="rounded-lg bg-purple-600 px-4 py-2 text-xs font-medium text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2">
                                                    Borrar
                                                </button>
                                            </form>
                                            {{-- <form action="{{ route('tickets.report', $ticket) }}" method="POST" style="display: inline-block;">
                                                @csrf
                                                <button type="submit" class="rounded-lg bg-purple-600 px-4 py-2 text-xs font-medium text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2">
                                                    Reporte
                                                </button>
                                            </form> --}}
                                        @endrole
                                        @role('user')
                                            @if($ticket->status === 'cerrado' && !\App\Models\TablaTicketValoracion::where('idTicket', $ticket->id)->exists())
                                                <button type="button" class="rounded-lg bg-purple-600 px-4 py-2 text-xs font-medium text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2" onclick="document.getElementById('rating-modal-{{ $ticket->id }}').style.display='block'">
                                                    {{ __('Puntuar') }}
                                                </button>
                                                <div id="rating-modal-{{ $ticket->id }}" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50" style="display: none; z-index: 9999; margin-left: calc(.5rem* calc(1 - var(--tw-space-x-reverse))) !important;">
                                                    <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-lg" style="height: 44%; width: 50%; margin: 15% 29%;">
                                                        <h2 class="text-xl font-semibold mb-4">Califique la atención de este ticket N° {{ $ticket->id }}</h2>
                                                        <form action="{{ route('tickets.clasificate', ['ticket' => $ticket->id]) }}" method="POST" onsubmit="return validateRating({{ $ticket->id }})">
                                                            @csrf
                                                            <div class="mb-4">
                                                                <label class="block mb-2">
                                                                    <input type="radio" name="rating" value="1" class="mr-2"> Excelente
                                                                </label>
                                                                <label class="block mb-2">
                                                                    <input type="radio" name="rating" value="2" class="mr-2"> Bueno
                                                                </label>
                                                                <label class="block mb-2">
                                                                    <input type="radio" name="rating" value="3" class="mr-2"> Regular
                                                                </label>
                                                                <label class="block mb-2">
                                                                    <input type="radio" name="rating" value="4" class="mr-2"> Malo
                                                                </label>
                                                            </div>
                                                            <input type="hidden" name="idTecnico" value="{{ $ticket->assigned_to }}">
                                                            <input type="hidden" name="IdUsuario" value="{{ $ticket->user_id }}">
                                                            <input type="hidden" name="idTicket" value="{{ $ticket->id }}">
                                                            <div class="flex justify-end">
                                                                <button type="button" class="mr-2 bg-purple-600 rounded-lg bg-gray-400 px-4 py-2 text-xs font-medium text-white transition duration-150 hover:bg-gray-500 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2" onclick="document.getElementById('rating-modal-{{ $ticket->id }}').style.display='none'">
                                                                    Cancelar
                                                                </button>
                                                                <button type="submit" class="rounded-lg bg-purple-600 px-4 py-2 text-xs font-medium text-white transition duration-150 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2">
                                                                    Enviar
                                                                </button>
                                                            </div>
                                                        </form>
                                                        <script>
                                                            function validateRating(ticketId) {
                                                                var rating = document.querySelector('input[name="rating"]:checked');
                                                                if (!rating) {
                                                                    alert('Por favor seleccione una calificación.');
                                                                    return false;
                                                                }
                                                                return true;
                                                            }
                                                        </script>
                                                        </form>
                                                    </div>
                                                </div>
                                            @elseif ($ticket->status === 'cerrado' && \App\Models\TablaTicketValoracion::where('idTicket', $ticket->id)->exists())
                                                <p>Ya se Atendio</p>
                                            @endif
                                        @endrole
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="px-4 py-3" colspan="4">No se tiene ningun Tickets.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            @if($tickets->hasPages())
                <div class="border-t bg-gray-50 px-4 py-3 text-xs font-semibold uppercase tracking-wide text-gray-500 sm:grid-cols-9">
                    {{ $tickets->withQueryString()->links() }}
                </div>
            @endif
        </div>
    </div>
</x-app-layout>
