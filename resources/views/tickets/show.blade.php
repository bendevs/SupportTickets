<x-app-layout>
    <x-slot name="header">
        {{ $ticket->title }}
    </x-slot>

    @hasanyrole('admin|agent')
        <div class="mb-4 flex justify-end space-x-2">
            @if($ticket->isOpen())
                <form action="{{ route('tickets.close', $ticket) }}" method="POST" style="display: inline-block;">
                    @csrf
                    @method('PATCH')
                    <x-primary-button>
                        CERRAR TICKET
                    </x-primary-button>
                </form>
            @elseif(!$ticket->isArchived())
                <form action="{{ route('tickets.reopen', $ticket) }}" method="POST" class="mr-2" style="display: inline-block;">
                    @csrf
                    @method('PATCH')
                    <x-primary-button>
                        REABRIR TICKET
                    </x-primary-button>
                </form>

                <form action="{{ route('tickets.archive', $ticket) }}" method="POST" style="display: inline-block;">
                    @csrf
                    @method('PATCH')
                    <x-primary-button>
                        ARCHIVAR TICKET
                    </x-primary-button>
                </form>
            @endif
        </div>
    @endhasanyrole

    <div class="space-y-4">
        <div class="min-w-0 rounded-lg bg-white p-4 shadow-xs">
            <h4 class="mb-4 font-semibold text-gray-600">
                Descripcion del ticket
            </h4>
            <p class="text-gray-600">
                {{ $ticket->message }}
            </p>
        </div>

        @if($ticket->getMedia('tickets_attachments')->count())
            <div class="min-w-0 rounded-lg bg-white p-4 shadow-xs">
                <h4 class="mb-4 font-semibold text-gray-600">
                    Adjuntos
                </h4>

                @foreach($ticket->getMedia('tickets_attachments') as $media)
                    <p>
                        <a href="{{ route('attachment-download', $media) }}" class="hover:underline">{{ $media->file_name }}</a>
                    </p>
                @endforeach
            </div>
        @endif

        <div class="min-w-0 rounded-lg bg-white p-4 shadow-xs space-y-4">
            <h4 class="mb-4 font-semibold text-gray-600">
                Comentarios
            </h4>

            @if(!$ticket->isArchived())
                <form action="{{ route('message.store', $ticket) }}" method="POST">
                    @csrf

                    <div>
                        <textarea id="message" name="message">{{ old('message') }}</textarea>
                        <x-input-error :messages="$errors->get('message')" class="mt-2" />
                    </div>

                    <x-primary-button class="mt-4">
                        Enviar
                    </x-primary-button>
                </form>
            @endif

            @forelse($ticket->messages as $message)
                <div class="flex items-start space-x-3 p-3 rounded-lg bg-gray-50 shadow">
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
</x-app-layout>
