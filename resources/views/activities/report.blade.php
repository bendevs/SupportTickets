<x-app-layout>
    <x-slot name="header">
       {{ __('Reportes') }}
    </x-slot>
    <div class="p-4 bg-white rounded-lg shadow-xs mb-4">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Navegación de Reportes</h2>
        <div class="space-y-2">
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#reporte-tecnico'">
                Reporte de tickets por técnico
            </button>
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#reporte-departamento'">
                Reporte de tickets por Departamento
            </button>
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#reporte-categoria'">
                Reporte de tickets por Categoria
            </button>
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#reporte-incidencias'">
                Reporte de Incidencias
            </button>
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#ticket-frecuente'">
                Ticket más Frecuente
            </button>
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#reporte-prioridad'">
                Reporte de tickets por Prioridad
            </button>
            <button
                type="button"
                class="inline-block rounded bg-blue-500 px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:bg-blue-600 focus:bg-blue-600 focus:outline-none active:bg-blue-700"
                onclick="location.href='#Ticket-fechas'">
                Reporte de tickets por Fecha
            </button>
        </div>
    </div>
    <div id="reporte-tecnico" class="p-4 bg-white rounded-lg shadow-xs">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Reporte de tickets por técnico</h2>
        </div>

        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                            <th class="px-4 py-3">Tecnico</th>
                            <th class="px-4 py-3">Total</th>
                            <th class="px-4 py-3">Tickets Abiertos</th>
                            <th class="px-4 py-3">Tickets Cerrados</th>
                            <th class="px-4 py-3">Tickets Archivados</th>
                            <th class="px-4 py-3">Tickets Totales</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y">
                        @forelse($datosTicketsPorTecnico as $datosTicket)
                            <tr class="text-gray-700">
                                <td class="px-4 py-3 text-sm">
                                    {{ $datosTicket->user->name }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $datosTicket->total_tickets }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $datosTicket->total_abiertos }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $datosTicket->total_cerrados }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $datosTicket->total_archivados }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    <button onclick="openModal('{{ $datosTicket->user->name }}')" class="bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">Ver Detalles</button>

                                    <!-- Modal -->
                                    <div id="modal-{{ $datosTicket->user->name }}" class="fixed inset-0 flex items-start justify-center bg-gray-800 bg-opacity-50 hidden overflow-y-auto" style="margin-top: 4%;">
                                        <div class="bg-white rounded-lg shadow-lg p-6 w-1/2 max-h-3/4 overflow-y-scroll">
                                            <h2 class="text-2xl font-bold mb-4">Tickets</h2>
                                            @foreach ($tickets as $ticket)
                                                @if ($ticket->assigned_to == $datosTicket->user_id)
                                                    <br>
                                                    <p>Id: {{ $ticket->id }}</p>
                                                    <p>Titulo: {{ $ticket->title }}</p>
                                                    <p>Prioridad: {{ $ticket->priority }}</p>
                                                    <p>Estado: {{ $ticket->status }}</p>
                                                    <p>Fecha Soporte: @if ($ticket->fecha_soporte != null)
                                                        {{ $ticket->fecha_soporte }}
                                                    @else
                                                        Fecha no asignada
                                                    @endif</p>
                                                    <br>
                                                    <hr class="my-4">
                                                @endif
                                            @endforeach
                                            <button onclick="closeModal('{{ $datosTicket->user->name }}')" class="mt-4 px-4 py-2 bg-blue-500 text-white rounded">Cerrar</button>
                                        </div>
                                    </div>

                                    <script>
                                        function openModal(name) {
                                            document.getElementById('modal-' + name).classList.remove('hidden');
                                            document.getElementById('modal-' + name).classList.add('flex');
                                        }

                                        function closeModal(name) {
                                            document.getElementById('modal-' + name).classList.remove('flex');
                                            document.getElementById('modal-' + name).classList.add('hidden');
                                        }
                                    </script>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="px-4 py-3" colspan="6">No hay datos.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
                <a href="{{ route('generatePDFTicketsTecnico.pdf') }}" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-black font-semibold rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
                    <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                    </svg>
                    Descargar PDF
                </a>
            </div>
        </div>
        <!-- Repeat similar structure for other reports -->
    </div>
    <div id="reporte-departamento" class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Reporte de tickets por Departamento</h2>
        </div>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                        <th class="px-4 py-3">Departamento</th>
                        <th class="px-4 py-3">Total</th>
                        <th class="px-4 py-3">Tickets Abiertos</th>
                        <th class="px-4 py-3">Tickets Cerrados</th>
                        <th class="px-4 py-3">Tickets Archivados</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y">
                    @forelse($datosTicketsPorDepartamento as $datosTicket)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->departamento }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->total_tickets }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->total_abiertos }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->total_cerrados }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->total_archivados }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="px-4 py-3" colspan="4">No hay datos.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <a href="{{ route('generatePDFTicketsDepartamento.pdf') }}" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-black font-semibold rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
                <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Descargar PDF
            </a>
        </div>
    </div>
    <div id="reporte-categoria" class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Reporte de tickets por Categoria</h2>
        </div>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                        <th class="px-4 py-3">Categoria</th>
                        <th class="px-4 py-3">Total</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y">
                    @forelse($datosTicketsCategoria as $datosTicket)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->nombre_categoria }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->total_categoria }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="px-4 py-3" colspan="4">No hay datos.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <a href="{{ route('generatePDFTicketsCategoria.pdf') }}" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-black font-semibold rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
                <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Descargar PDF
            </a>
        </div>
    </div>
    <div id="reporte-incidencias" class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Reporte de Incidencias</h2>
        </div>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                        <th class="px-4 py-3">Maquina</th>
                        <th class="px-4 py-3">Total de Incidencia</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y">
                    @forelse($datosCantidadEquipos as $datosCantidadEquipo)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 text-sm">
                                {{ $datosCantidadEquipo->nombre_equipo }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosCantidadEquipo->cantidad }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="px-4 py-3" colspan="4">No hay datos.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <a href="{{ route('generatePDFTicketsEquiposIncideincias.pdf') }}" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-black font-semibold rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
                <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Descargar PDF
            </a>
        </div>
    </div>
    <div id="reporte-prioridad" class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Reporte de tickets por Prioridad</h2>
        </div>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                        <th class="px-4 py-3">Titulo</th>
                        <th class="px-4 py-3">Prioridad</th>
                        <th class="px-4 py-3">Estado</th>
                        <th class="px-4 py-3">Técnico</th>
                        <th class="px-4 py-3">Fecha de Creación</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y">
                    @forelse($datosTicketsPrioridad as $datosTicket)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->title }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->priority }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->status }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $datosTicket->user->name }} {{ $datosTicket->user->lastname }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ \Carbon\Carbon::parse($datosTicket->created_at)->locale('es')->isoFormat('D [de] MMMM [del] YYYY') }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="px-4 py-3" colspan="4">No hay datos.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
           
            <a href="{{ route('generatePDFTicketsEstado.pdf') }}" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-black font-semibold rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
                <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Descargar PDF
            </a>
        </div>
    </div>
    <div id="Ticket-fechas">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Reporte de tickets por Fecha</h2>
        </div>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                        <th class="px-4 py-3">Titulo</th>
                        <th class="px-4 py-3">Estado</th>
                        <th class="px-4 py-3">Técnico</th>
                        <th class="px-4 py-3">Fecha de Creación</th>
                        <th class="px-4 py-3">T.A.</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y">
                    @forelse($tickets as $ticket)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 text-sm">
                                {{ $ticket->title }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $ticket->status }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $ticket->user->name }} {{ $datosTicket->user->lastname }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ \Carbon\Carbon::parse($ticket->created_at)->locale('es')->isoFormat('D [de] MMMM [del] YYYY') }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                @if ($ticket->created_at == $ticket->updated_at && $ticket->status == 'abierto')
                                <span title="No Atendido">
                                    N.A
                                </span>
                                @elseif ($ticket->created_at != $ticket->updated_at)
                                    @if (\Carbon\Carbon::parse($ticket->updated_at)->diffInDays(\Carbon\Carbon::parse($ticket->created_at)) > 3)
                                        <span style="color: red" title="Atiéndalo inmediatamente">
                                            {{ \Carbon\Carbon::parse($ticket->updated_at)->diffInDays(\Carbon\Carbon::parse($ticket->created_at)) }} días
                                        </span>
                                    @else
                                        {{ \Carbon\Carbon::parse($ticket->updated_at)->diffInDays(\Carbon\Carbon::parse($ticket->created_at)) }} días
                                    @endif
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="px-4 py-3" colspan="4">No hay datos.</td>   
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <a href="{{ route('generatePDFTicketsFecha.pdf') }}" class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-black font-semibold rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
                <svg class="h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
                Descargar PDF
            </a>
    </div>
    <div  id="ticket-frecuente" class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
        <div class="flex items-center mb-4 p-2">
            <svg class="h-8 w-8 mr-2 text-gray-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
            </svg>
            <h2 class="text-2xl font-bold text-gray-800">Ticket más Frecuente</h2>
        </div>
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                    <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                        <th class="px-4 py-3">Nro. de Ticket</th>
                        <th class="px-4 py-3">Caso</th>
                        <th class="px-4 py-3">Fecuencia</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y">
                    @forelse($contadorTickets as $contadorTicket)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 text-sm">
                                Ticket Nro° {{ $contadorTicket->id }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $contadorTicket->title }}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                {{ $contadorTicket->count }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="px-4 py-3" colspan="4">No hay datos.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</x-app-layout>
