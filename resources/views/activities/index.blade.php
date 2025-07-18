<x-app-layout>
    <x-slot name="header">
{{--        {{ __('Activities Logs') }}--}}
    </x-slot>

    <div class="p-4 bg-white rounded-lg shadow-xs">

        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                            <th class="px-4 py-3">Descripción</th>
                            <th class="px-4 py-3">ID del Sujeto</th>
                            <th class="px-4 py-3">Tipo de Sujeto</th>
                            <th class="px-4 py-3">Causante</th>
                            <th class="px-4 py-3">Creado en</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y">
                        @forelse($activities as $activity)
                            <tr class="text-gray-700">
                                <td class="px-4 py-3 text-sm">
                                    @if ($activity->description == "updated")
                                        Actualizado
                                    @elseif ($activity->description == "created")
                                        Creado
                                    @elseif ($activity->description == "deleted")
                                        Eliminado
                                    @endif
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $activity->subject_id }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $activity->subject_type }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $activity?->causer()->first()->name }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $activity->created_at }}
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="px-4 py-3" colspan="4">No activities found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            @if($activities->hasPages())
                <div class="px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t bg-gray-50 sm:grid-cols-9">
                    {{ $activities->links() }}
                </div>
            @endif
        </div>

    </div>
</x-app-layout>
