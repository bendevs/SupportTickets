<x-app-layout>
    <x-slot name="header">
        {{ __('Valoraciones') }}
    </x-slot>
    <h2 class="text-2xl font-bold mb-4">Lista de Técnicos</h2>
    @foreach ($ticketsValoracion as $ticket)
        <div class="mb-6">
            <table class="w-full bg-white border border-gray-200">
                <tbody>
                    <tr>
                        <td rowspan="5" class="border px-4 py-2 align-top">
                            @foreach ($usuarios as $usuario)
                                @if ($usuario->id == $ticket->idTecnico)
                                    <p class="font-semibold">{{ $usuario->name }}</p>
                                @endif
                            @endforeach
                        </td>
                    </tr>
                    <tr>
                        <td class="border px-4 py-2">Excelente</td>
                        <td class="border px-4 py-2">{{ $ticket->excelente }}</td>
                    </tr>
                    <tr>
                        <td class="border px-4 py-2">Bueno</td>
                        <td class="border px-4 py-2">{{ $ticket->bueno }}</td>
                    </tr>
                    <tr>
                        <td class="border px-4 py-2">Regular</td>
                        <td class="border px-4 py-2">{{ $ticket->regular }}</td>
                    </tr>
                    <tr>
                        <td class="border px-4 py-2">Malo</td>
                        <td class="border px-4 py-2">{{ $ticket->malo }}</td> 
                    </tr>
                </tbody>
            </table>
        </div>
    @endforeach
</x-app-layout>