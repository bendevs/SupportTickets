<x-app-layout>
    <x-slot name="header">
        {{ __('Resultados de Búsqueda') }}
    </x-slot>

    <div class="rounded-lg bg-white p-6 shadow-md">
        <div class="mb-6 w-full overflow-hidden rounded-lg border shadow-md">
            <div class="w-full overflow-x-auto p-4">
                <h1 class="text-2xl font-bold mb-4">Resultados de búsqueda para "{{ $query }}"</h1>
                @if(collect($comments)->isEmpty())
                    <p>No se encontraron comentarios.</p>
                @else
                    <ul>
                        @foreach($comments as $comment)
                            <li class="flex items-start mb-6 border-b pb-4">
                                <div class="flex-shrink-0 mr-4">
                                    <img class="h-12 w-12 rounded-full object-cover" src="https://www.gravatar.com/avatar/{{ md5($comment->email) }}" alt="{{ $comment->name }}">
                                </div>
                                <div class="flex-grow">
                                    <div class="flex items-center justify-between">
                                        <div>
                                        <a href="{{ route('tickets.show', $comment->ticket_id) }}" class="text-lg font-bold text-blue-500 hover:underline">
                                            Ticket #{{ $comment->ticket_id }}
                                        </a>
                                            <span class="text-sm text-gray-600 ml-2">{{ $comment->created_at}}</span>
                                        </div>
                                    </div>
                                    <div class="mt-2">
                                        <h2 class="text-xl font-semibold">{{ $comment->title }}</h2>
                                        <p class="mt-1 text-gray-700">
                                            {{ \Illuminate\Support\Str::limit($comment->message, 150, $end='...') }}
                                        </p>
                                    </div>
                                    <div class="mt-2 text-sm text-gray-500">
                                        Comentado por {{ $comment->name }}
                                    </div>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>
