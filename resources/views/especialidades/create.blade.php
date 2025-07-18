<x-app-layout>
    <x-slot name="header">
        {{ __('Crear Especialidad') }}
    </x-slot>

    <div class="rounded-lg bg-white p-4 shadow-md">

        <form action="{{ route('especialidad.store') }}" method="POST">
            @csrf

            <div>
                <x-input-label for="especialidad" :value="__('Nombre de Especialidad')" />
                <x-text-input type="text"
                              id="especialidad"
                              name="especialidad"
                              class="block w-full"
                              value="{{ old('especialidad') }}"
                              required />
                <x-input-error :messages="$errors->get('especialidad')" class="mt-2" />
            </div>

            <div>
                <x-input-label for="caracteristica" :value="__('Caracteristica')" />
                <textarea id="caracteristica"
                          name="caracteristica"
                          class="block w-full rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                          required>{{ old('caracteristica') }}</textarea>
                <x-input-error :messages="$errors->get('caracteristica')" class="mt-2" />
            </div>            

            <div class="mt-4">
                <x-primary-button>
                    {{ __('Submit') }}
                </x-primary-button>
            </div>
        </form>

    </div>
</x-app-layout>
