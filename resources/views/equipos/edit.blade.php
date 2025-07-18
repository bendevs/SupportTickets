<x-app-layout>
    <x-slot name="header">
        {{ __('Actualizar Equipo') }}
    </x-slot>

    <div class="rounded-lg bg-white p-4 shadow-md">

        <form action="{{ route('equipos.update', $equipo) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="mt-4">
                <x-input-label for="id_usuario" :value="__('Assign to')" />
                <select name="id_usuario" id="id_usuario" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50">
                    <option value="" selected disabled>-- SELECCIONAR USUARIO --</option>
                    @foreach($usuarios as $usuario)
                        <option value="{{ $usuario->id }}" 
                            @if(old('id_usuario', $equipo->id_usuario) == $usuario->id) selected @endif>
                            {{ $usuario->name }}
                        </option>
                    @endforeach
                </select>
                <x-input-error :messages="$errors->get('id_usuario')" class="mt-2" />
            </div>            
            <div class="mt-4">
                <x-input-label for="nombre_equipo" :value="__('Equipo')" />
                <x-text-input type="text"
                              id="nombre_equipo"
                              name="nombre_equipo"
                              class="block w-full"
                              value="{{ old('nombre_equipo', $equipo->nombre_equipo) }}"
                              required />
                <x-input-error :messages="$errors->get('nombre_equipo')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-input-label for="tipo" :value="__('Tipo de Equipo')" />
                <select id="tipo" name="tipo" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50" required>
                    <option value="" selected disabled>-- Seleccionar Tipo de Equipo --</option>
                    <option value="Computadora" {{ old('tipo', $equipo->tipo) == 'Computadora' ? 'selected' : '' }}>Computadora</option>
                    <option value="Impresora" {{ old('tipo', $equipo->tipo) == 'Impresora' ? 'selected' : '' }}>Impresora</option>
                    <option value="Proyector" {{ old('tipo', $equipo->tipo) == 'Proyector' ? 'selected' : '' }}>Proyector</option>
                    <option value="Escáner" {{ old('tipo', $equipo->tipo) == 'Escáner' ? 'selected' : '' }}>Escáner</option>
                    <option value="Servidor" {{ old('tipo', $equipo->tipo) == 'Servidor' ? 'selected' : '' }}>Servidor</option>
                    <option value="Laptop" {{ old('tipo', $equipo->tipo) == 'Laptop' ? 'selected' : '' }}>Laptop</option>
                    <option value="Servidor" {{ old('tipo', $equipo->tipo) == 'Servidor' ? 'selected' : '' }}>Servidor</option>
                    <option value="Router" {{ old('tipo', $equipo->tipo) == 'Router' ? 'selected' : '' }}>Router</option>
                    <option value="Cableado" {{ old('tipo', $equipo->tipo) == 'Cableado' ? 'selected' : '' }}>Cableado</option>
                </select>
                <x-input-error :messages="$errors->get('tipo')" class="mt-2" />
            </div>
            
            <div class="mt-4">
                <x-input-label for="assigned_to" :value="__('Área / Unidad')" />
                <select class="block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50" name="area_unidad" id="departamento">
                    <option value="" selected disabled>-- SELECCIONAR ÁREA / UNIDAD --</option>
                    @foreach(\App\Enums\Departamentos::cases() as $departamento)
                        <option value="{{ $departamento->value }}" 
                            @if(old('area_unidad', $equipo->area_unidad) == $departamento->value) selected @endif>
                            {{ $departamento->name }}
                        </option>
                    @endforeach
                </select>
                <x-input-error :messages="$errors->get('area_unidad')" class="mt-2" />
            </div>                
            <div class="mt-4">
                <x-input-label for="correo_institucional" :value="__('Correo Institucional')" />
                <x-text-input type="email"
                              id="correo_institucional"
                              name="correo_institucional"
                              class="block w-full"
                              value="{{ old('correo_institucional', $equipo->correo_institucional) }}"
                              required />
                <x-input-error :messages="$errors->get('correo_institucional')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-primary-button>
                    {{ __('Submit') }}
                </x-primary-button>
            </div>
        </form>
    </div>
</x-app-layout>
