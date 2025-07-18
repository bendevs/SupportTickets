<x-app-layout>
    <x-slot name="header">
        {{ __('Selección del Personal') }}
    </x-slot>

    <div class="flex mb-4">
        <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('personalEspecialidad.create') }}">
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
                            <th class="px-4 py-3">Especialidad</th>
                            <th class="px-4 py-3">Fecha de Inicio</th>
                            <th class="px-4 py-3">Fecha de Conclusión</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y">
                        @forelse($personalEspecialidad as $personal)
                            <tr class="text-gray-700">
                                <td class="px-4 py-3 text-sm">
                                    @foreach ($usuarios as $usuario)
                                        @if ($usuario->id == $personal->id_users)
                                            {{$usuario->name}}
                                        @endif
                                    @endforeach
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @foreach ($tecnicos as $tecnico)
                                        @if ($tecnico->id == $personal->id_especialidades)
                                            {{$tecnico->especialidad}}
                                        @endif
                                    @endforeach
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $personal->fecha_inicio }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @if ($personal->fecha_fin == null)
                                       No se tienen datos aun...
                                    @else
                                        {{ $personal->fecha_fin }}
                                    @endif
                                </td>
                                
                                <td class="px-4 py-3 space-x-2">
                                    <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border-2 border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('personalEspecialidad.edit', $personal->id) }}">
                                        {{ __('Edit') }}
                                    </a>
                                    
                                    <form action="{{ route('personalEspecialidad.destroy', $personal) }}" method="POST" onsubmit="return confirm('Esta seguro en eliminar esta etiqueta?')" style="display: inline-block;">
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

            @if($personalEspecialidad->hasPages())
                <div class="px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t bg-gray-50 sm:grid-cols-9">
                    {{ $personalEspecialidad->links() }}
                </div>
            @endif
        </div>

    </div>
</x-app-layout>