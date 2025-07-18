<x-app-layout>
    <x-slot name="header">
        {{ __('Editar Tickets') }}
    </x-slot>

    <div class="rounded-lg bg-white p-4 shadow-md">

        <form action="{{ route('tickets.update', $ticket) }}" method="POST">
            @csrf
            @method('PATCH')

            <div>
                <x-input-label for="title" :value="__('Title')" />
                <x-text-input type="text"
                              id="title"
                              name="title"
                              class="block w-full"
                              value="{{ old('title', $ticket->title) }}"
                              {{-- @if (auth()->user()->hasRole('admin'))
                                readonly
                              @endif --}}
                              required />
                <x-input-error :messages="$errors->get('title')" class="mt-2" />
            </div>
            

            <div class="mt-4">
                <x-input-label for="message" :value="__('Message')" />
                <textarea id="message"
                          name="message"
                          class="mt-1 block h-32 w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50"
                          required>{{ old('message', $ticket->message) }}</textarea>
                <x-input-error :messages="$errors->get('message')" class="mt-2" />
            </div>

            <div class="mt-4">
                <x-input-label for="labels" :value="__('Labels')" />
                    @foreach($labels as $id => $name)
                        <div class="mt-1 inline-flex space-x-1">
                            <input class="text-purple-600 form-checkbox focus:shadow-outline-purple focus:border-purple-400 focus:outline-none"
                                   type="checkbox" name="labels[]" id="label-{{ $id }}" value="{{ $id }}"
                                    @checked(old('labels') ? in_array($id, old('labels', [])) : $ticket->labels->contains($id))>
                            <x-input-label for="label-{{ $id }}">{{ $name }}</x-input-label>
                        </div>
                    @endforeach
                <x-input-error :messages="$errors->get('labels')" class="mt-2" />
            </div>

            <div class="mt-4">
                <x-input-label for="categories" :value="__('Categories')" />
                    @foreach($categories as $id => $name)
                        <div class="mt-1 inline-flex space-x-1">
                            <input class="text-purple-600 form-checkbox focus:shadow-outline-purple focus:border-purple-400 focus:outline-none"
                                   type="checkbox" name="categories[]" id="category-{{ $id }}" value="{{ $id }}"
                                    @checked(old('categories') ? in_array($id, old('categories', [])) : $ticket->categories->contains($id))>
                            <x-input-label for="category-{{ $id }}">{{ $name }}</x-input-label>
                        </div>
                    @endforeach
                <x-input-error :messages="$errors->get('categories')" class="mt-2" />
            </div>

            <div class="mt-4">
                <x-input-label for="priority" :value="__('Priority')" />
                <select name="priority" id="priority" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50">
                    @foreach(\App\Enums\Priority::cases() as $priority)
                        <option value="{{ $priority->value }}" @selected(old('priority', $ticket->priority) == $priority->value)>{{ $priority->name }}</option>
                    @endforeach
                </select>
                <x-input-error :messages="$errors->get('priority')" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-input-label for="status" :value="__('Estado')" />
                <select name="status" id="status" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50">
                    @foreach(\App\Enums\Status::cases() as $status)
                        <option value="{{ $status->value }}" @selected(old('status', $ticket->status) == $status->value)>{{ $status->name }}</option>
                    @endforeach
                </select>
                <x-input-error :messages="$errors->get('status')" class="mt-2" />
            </div>
            @if ($estados)
                <div class="mt-4">
                    <x-input-label for="estado" :value="__('Estado del Equipo')" />
                    <select class="block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50" name="estado" id="estado">
                        <option value="" disabled>{{ __('-- SELECCIONA SU ESTADO --') }}</option>
                        <option value="en_mantenimiento" @selected(old('estado', $estados->estado) == 'en_mantenimiento')>{{ __('En Mantenimiento') }}</option>
                        <option value="arreglado" @selected(old('estado', $estados->estado) == 'arreglado')>{{ __('Arreglado') }}</option>
                        <option value="baja" @selected(old('estado', $estados->estado) == 'baja')>{{ __('Baja') }}</option>
                    </select>
                    <x-input-error :messages="$errors->get('estado')" class="mt-2" />
                </div>
                <input type="hidden" name="estados" value="{{ $estados->id }}">
                <div class="mt-4">
                    <x-input-label for="ubicacion" :value="__('Ubicación del Equipo')" />
                    <select class="block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50" name="ubicacion" id="ubicacion">
                        <option value="" disabled>{{ __('-- SELECCIONA SU UBICACIÓN --') }}</option>
                        <option value="Mantenimiento en establecimiento" @selected(old('estado', $estados->ubicacion) == 'Mantenimiento en establecimiento')>{{ __('Mantenimiento en establecimiento') }}</option>
                        <option value="Mantenimiento en Exterior" @selected(old('estado', $estados->ubicacion) == 'Mantenimiento en Exterior')>{{ __('Mantenimiento en Exterior') }}</option>
                    </select>
                    <x-input-error :messages="$errors->get('ubicacion')" class="mt-2" />
                </div>
            @else
                <div class="mt-4">
                    <x-input-label for="equipo" :value="__('Equipo')" />
                    <select class="block w-full rounded-md border-gray-300 shadow-sm focus-within:text-primary-600 focus:border-primary-300 focus:ring-primary-200 focus:ring focus:ring-opacity-50" name="equipo" id="equipo">
                        <option value="" selected disabled>-- SELECCIONAR EQUIPO --</option>
                        @foreach($equipos as $equipo)
                            <option value="{{ $equipo->id }}">{{ $equipo->nombre_equipo }} - {{ $equipo->id_usuario }}</option>
                        @endforeach 
                    </select>
                    <x-input-error :messages="$errors->get('departamento')" class="mt-2" />
                </div>
            @endif
                <div class="mt-4">
                    <input type="file" name="attachments[]" multiple>
                    <x-input-error :messages="$errors->get('attachments')" class="mt-2" />
                </div>
                <div class="mt-4">
                    <x-primary-button>
                        Grabar cambios ticket
                    </x-primary-button>
                </div>
            </form>
            
        <div x-data="{ open: false }" class="mt-8">
            <button @click="open = !open" class="w-full flex justify-between items-center p-4 bg-purple-600 text-white rounded-lg shadow-md focus:outline-none">
                <span>Comentarios (presionar para desplegar)</span>
                <svg x-show="!open" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 01.117 1.993L10 7H6a1 1 0 01-.117-1.993L6 5h4zM10 13a1 1 0 01.117 1.993L10 15H6a1 1 0 01-.117-1.993L6 13h4zm5-7a1 1 0 01.117 1.993L15 8h-4a1 1 0 01-.117-1.993L11 6h4zm0 8a1 1 0 01.117 1.993L15 15h-4a1 1 0 01-.117-1.993L11 13h4z" clip-rule="evenodd" />
                </svg>
                <svg x-show="open" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M5 10a1 1 0 011.993.117L7 10v4a1 1 0 01-1.993.117L5 14v-4zm6-4a1 1 0 011.993.117L13 6v4a1 1 0 01-1.993.117L11 10V6zm-3 4a1 1 0 01.117 1.993L8 12H5a1 1 0 01-.117-1.993L5 10h3zm0-4a1 1 0 01.117 1.993L8 8H5a1 1 0 01-.117-1.993L5 6h3zm7 0a1 1 0 01.117 1.993L15 8h-3a1 1 0 01-.117-1.993L12 6h3zm0 8a1 1 0 01.117 1.993L15 16h-3a1 1 0 01-.117-1.993L12 14h3z" clip-rule="evenodd" />
                </svg>
            </button>
            <div x-show="open" class="mt-4 p-4 bg-white rounded-lg shadow-md">
                @if(!$ticket->isArchived())
                    <form action="{{ route('message.store', $ticket) }}" method="POST">
                        @csrf
                        <div>
                            <textarea id="message" name="message" class="w-full p-2 border rounded-md">{{ old('message') }}</textarea>
                            <x-input-error :messages="$errors->get('message')" class="mt-2" />
                        </div>
                        <x-primary-button class="mt-4">
                            Guardar Comentario
                        </x-primary-button>
                    </form>
                @endif

                @forelse($ticket->messages as $message)
                    <div class="flex items-start space-x-3 p-3 rounded-lg bg-gray-50 shadow mt-4">
                        <div class="flex-shrink-0">
                            <x-avatar :name="$message->user->name" />
                        </div>
                        <div>
                            <div class="flex items-center space-x-2">
                                <h5 class="font-semibold text-gray-900">{{ $message->user->name }}</h5>
                                <span class="text-sm text-gray-600">{{ $message->created_at->format('d M, Y h:i A') }}</span>
                            </div>
                            <p class="mt-1 text-gray-800">{!! $message->message !!}</p>
                        </div>
                    </div>
                @empty
                    <p class="text-gray-600">
                        No existen comentarios
                    </p>
                @endforelse
            </div>
        </div>

    </div>
</x-app-layout>
