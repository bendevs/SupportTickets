<x-app-layout>
    <x-slot name="header">
        {{ __('Equipos') }}
    </x-slot>

    <div class="flex mb-4">
        <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('equipos.create') }}">
            {{ __('Create') }}
        </a>
    </div>
    @if(session('success'))
        <div id="success-message" class="bg-green-500 text-white px-4 py-3 rounded shadow-md" role="alert">
            <strong>{{ session('success') }}</strong>
        </div>

        <script>
            setTimeout(function() {
                var successMessage = document.getElementById('success-message');
                if (successMessage) {
                    successMessage.style.display = 'none';
                }
            }, 5000);
        </script>
    @endif
    <div class="p-4 bg-white rounded-lg shadow-xs">

        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                            <th class="px-4 py-3">Usuario</th>
                            <th class="px-4 py-3">Equipo</th>
                            <th class="px-4 py-3">Area/Unidad</th>
                            <th class="px-q py-3">Estado</th>
                            <th class="px-4 py-3">Dirección IP</th>
                            <th class="px-4 py-3">Correo</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y">
                        @forelse($equipos as $equipo)
                            <tr class="text-gray-700">
                                <td class="px-4 py-3 text-sm">
                                    @foreach ($usuarios as $usuario)
                                        @if ($usuario->id == $equipo->id_usuario)
                                            {{$usuario->name}}
                                        @endif
                                    @endforeach
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $equipo->nombre_equipo }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $equipo->area_unidad }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @if ($equipo->estadoEquipo)
                                        {{ $equipo->estadoEquipo }}
                                    @else
                                        Aun no esta actualizado
                                    @endif
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $equipo->direccion_ip }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $equipo->correo_institucional }}
                                </td>
                                
                                <td class="px-4 py-3 space-x-2">
                                    <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border-2 border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('equipos.edit', $equipo->id) }}">
                                        {{ __('Edit') }}
                                    </a>
                                    
                                    <form action="{{ route('equipos.destroy', $equipo) }}" method="POST" onsubmit="return confirm('Esta seguro en eliminar esta etiqueta?')" style="display: inline-block;">
                                        @csrf
                                        @method('DELETE')
                                        <x-primary-button>
                                            Eliminar
                                        </x-primary-button>
                                    </form>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="px-4 py-3" colspan="4">No se agrego ninguna especialidad.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            @if($equipos->hasPages())
                <div class="px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t bg-gray-50 sm:grid-cols-9">
                    {{ $equipos->links() }}
                </div>
            @endif
        </div>

    </div>
</x-app-layout>