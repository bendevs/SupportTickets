<x-app-layout>
    <x-slot name="header">
        {{ __('Adicionar Especialidad del Personal') }}
    </x-slot>

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

    <div class="rounded-lg bg-white p-4 shadow-md">

        <form action="{{ route('personalEspecialidad.store') }}" method="POST">
            @csrf
            <div class="mt-4">
                <x-input-label for="id_users" :value="__('Assign to')" />
                <select name="id_users" id="id_users" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50">
                    <option value="" selected disabled>-- SELECCIONAR USUARIO --</option>
                    @foreach($usuarios as $usuario)
                        @if ($usuario->roles()->first()->name === "admin"||$usuario->roles()->first()->name === "agent")
                            <option value="{{ $usuario->id }}" @selected(old('id_users', []))>{{ $usuario->name }}</option>    
                        @endif
                    @endforeach 
                </select>
                <x-input-error :messages="$errors->get('id_users')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-input-label for="id_especialidades" :value="__('Especialidad')" />
                <select name="id_especialidades" id="id_especialidades" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50">
                    <option value="" selected disabled>-- SELECCIONAR ESPECIALIDAD --</option>
                    @foreach($tecnicos as $tecnico)
                        <option value="{{ $tecnico->id }}" @selected(old('id_especialidades', []))>{{ $tecnico->especialidad }}</option>    
                    @endforeach 
                </select>
                <x-input-error :messages="$errors->get('id_especialidades')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-input-label for="fecha_inicio" :value="__('Fecha de Inicio')" />
                <x-text-input type="date"
                              id="fecha_inicio"
                              name="fecha_inicio"
                              class="block w-full"
                              value="{{ old('fecha_inicio', now()->format('Y-m-d')) }}"
                              required />
                <x-input-error :messages="$errors->get('fecha_inicio')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-input-label for="fecha_fin" :value="__('Fecha de Conclusión')" />
                <x-text-input type="date"
                              id="fecha_fin"
                              name="fecha_fin"
                              class="block w-full"
                              value="{{ old('fecha_fin') }}" />
                <x-input-error :messages="$errors->get('fecha_fin')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-primary-button>
                    {{ __('Submit') }}
                </x-primary-button>
            </div>
        </form>
    </div>
</x-app-layout>
