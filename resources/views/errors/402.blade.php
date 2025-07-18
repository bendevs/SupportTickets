<x-app-layout>
    <x-slot name="header">
        {{ __('Error 402') }}
    </x-slot>
    <div class="p-4 bg-white rounded-lg shadow-md">
        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-md">
            <div class="w-full overflow-x-auto">
                <div class="flex justify-center min-h-screen">
                    <div class="text-center p-4">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-16 h-16 text-blue-500 mx-auto">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.29 3.86a1 1 0 011.42 0l8.5 8.5a1 1 0 010 1.42l-8.5 8.5a1 1 0 01-1.42 0l-8.5-8.5a1 1 0 010-1.42l8.5-8.5zM12 7v6m0 4h.01" />
                        </svg>
                        <h1 class="text-6xl font-black text-gray-800">402</h1>
                        <h2 class="text-2xl mt-4 mb-2 font-semibold text-gray-700">Pago no Realizado</h2>
                        <p class="mb-6 text-gray-600">Lo sentimos, ¿su pago no fue realizado?
                            aunque esto es innecesario, igual lo ponemos, regresa a la anterior página</p>
                        <a href="{{ url()->previous() }}" class="inline-block bg-blue-500 text-white text-lg font-semibold py-2 px-6 rounded-full hover:bg-blue-600 transition-colors">
                            Regresar
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>