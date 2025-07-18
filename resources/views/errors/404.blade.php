<x-app-layout>
    <x-slot name="header">
        {{ __('Error 404') }}
    </x-slot>

    {{-- <div class="flex mb-4">
        <a class="px-4 py-2 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg hover:bg-purple-700 focus:outline-none focus:ring active:bg-purple-600" href="{{ route('especialidad.create') }}">
            {{ __('Error') }}
        </a>
    </div> --}}

    <div class="p-4 bg-white rounded-lg shadow-md">
        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-md">
            <div class="w-full overflow-x-auto">
                <div class="flex justify-center min-h-screen">
                    <div class="text-center p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-16 h-16 text-blue-500 mx-auto">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.29 3.86a1 1 0 011.42 0l8.5 8.5a1 1 0 010 1.42l-8.5 8.5a1 1 0 01-1.42 0l-8.5-8.5a1 1 0 010-1.42l8.5-8.5zM12 7v6m0 4h.01" />
                        </svg>
                        <h1 class="text-6xl font-black text-gray-800">404</h1>
                        <h2 class="text-2xl mt-4 mb-2 font-semibold text-gray-700">Página no encontrada</h2>
                        <p class="mb-6 text-gray-600">Lo sentimos, ¡la página que has buscado no existe en nuestro sitio web! ¿Quizás si regresas a la anterior página?</p>
                        <a href="{{ url()->previous() }}" class="inline-block bg-blue-500 text-white text-lg font-semibold py-2 px-6 rounded-full hover:bg-blue-600 transition-colors">
                            Regresar
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</x-app-layout>