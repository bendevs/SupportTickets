<x-app-layout>
    <x-slot name="header">
        {{ __('Categories') }}
    </x-slot>

    <div class="flex mb-4">
        <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('categories.create') }}">
            {{ __('Create') }}
        </a>
    </div>

    <div class="p-4 bg-white rounded-lg shadow-xs">

        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
                            <th class="px-4 py-3">Nombre</th>
                            <th class="px-4 py-3">Categoria</th>
                            <th class="px-4 py-3">Especialidad</th>
                            <th class="px-4 py-3">Es visible</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y">
                        @forelse($categories as $category)
                            <tr class="text-gray-700">
                                <td class="px-4 py-3 text-sm">
                                    {{ $category->name }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $category->slug }}
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    @if ($category->tecnico_id)
                                        @foreach ($tecnico as $item)
                                            @if ($item->id == $category->tecnico_id)
                                                {{ $item->especialidad }}
                                            @endif                                            
                                        @endforeach
                                    @else
                                        <span class="text-red-500">Sin técnico asignado</span>
                                    @endif
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    {{ $category->is_visible ? 'Si' : 'No' }}
                                </td>
                                <td class="px-4 py-3">
                                    <div class="flex justify-between">
                                        <!-- Botón Editar -->
                                        <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border-2 border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('categories.edit', $category) }}">
                                            {{ __('Edit') }}
                                        </a>
                                
                                        <!-- Formulario Eliminar -->
                                        <form action="{{ route('categories.destroy', $category) }}" method="POST" onsubmit="return confirm('¿Estás seguro?')" style="display: inline-block;">
                                            @csrf
                                            @method('DELETE')
                                            <x-primary-button>
                                                {{ __('Eliminar') }}
                                            </x-primary-button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="px-4 py-3" colspan="4">No categories found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            @if($categories->hasPages())
                <div class="px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t bg-gray-50 sm:grid-cols-9">
                    {{ $categories->links() }}
                </div>
            @endif
        </div>

    </div>
</x-app-layout>
