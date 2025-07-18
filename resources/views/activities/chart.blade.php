<x-app-layout>
    <x-slot name="header">
{{--        {{ __('Reporte por tecnico') }}--}}
    </x-slot>

    <div class="w-screen h-screen p-4 bg-white rounded-lg shadow-xs">
        <div class="w-full mb-8 overflow-hidden border rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto flex flex-col">
                <div class="flex flex-row">
                    <div class="container mx-auto mt-8 flex-1 flex flex-col justify-center">
                        <div class='mb-4 text-center'><h2 class="text-lg font-bold text-gray-800">Grafica de Tickets por tecnico</h2></div>
                        <div>
                            <canvas id="pie-chart" width="400" height="250"></canvas>
                        </div>
                    </div>

                    <div class="container mx-auto mt-8 flex-1 flex flex-col justify-center">
                        <div class='mb-4 text-center'><h2 class="text-lg font-bold text-gray-800">Grafica de Tickets por Departamento</h2></div>
                        <div>
                            <canvas id="pie-chart2" width="400" height="250"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Segunda fila -->
                <div class="flex flex-row">
                    <div class="container mx-auto mt-8 flex-1 flex flex-col justify-center">
                        <div class='mb-4 text-center'><h2 class="text-lg font-bold text-gray-800">Grafica de Tickets por Categoria</h2></div>
                        <div>
                            <canvas id="pie-chart3" width="400" height="250"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Nueva gráfica para Equipos -->
                <div class="flex flex-row mb-4">
                    <div class="container mx-auto mt-8 flex-1 flex flex-col justify-center">
                        <div class='mb-4 text-center'><h2 class="text-lg font-bold text-gray-800">Grafica de Equipos</h2></div>
                        <div>
                            <canvas id="pie-chart4" width="400" height="250"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Nueva gráfica para Mantenimiento -->
                {{-- <div class="flex flex-row">
                    <div class="container mx-auto mt-8 flex-1 flex flex-col justify-center">
                        <div class='mb-4 text-center'><h2 class="text-lg font-bold text-gray-800">Grafica de Mantenimiento</h2></div>
                        <div>
                            <canvas id="pie-chart5" width="400" height="250"></canvas>
                        </div>
                    </div>
                </div> --}}

                <!-- Agrega más contenedores y gráficas según sea necesario -->

                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    // Código JavaScript para el primer gráfico
                    var ctx1 = document.getElementById('pie-chart').getContext('2d');
                    var data1 = @json($dataTicketsTecnicoTorta);

                    var myChart1 = new Chart(ctx1, {
                        type: 'pie',
                        data: {
                            labels: Object.keys(data1),
                            datasets: [{
                                label: 'Tickets',
                                data: Object.values(data1),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.5)',
                                    'rgba(54, 162, 235, 0.5)',
                                    'rgba(255, 206, 86, 0.5)',
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                        }
                    });

                    // Código JavaScript para el segundo gráfico
                    var ctx2 = document.getElementById('pie-chart2').getContext('2d');
                    var data2 = @json($dataTicketsDepartamentoTorta);
                    console.log(data2);
                    var myChart2 = new Chart(ctx2, {
                        type: 'pie',
                        data: {
                            labels: Object.keys(data2),
                            datasets: [{
                                label: 'Tickets',
                                data: Object.values(data2),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.5)',
                                    'rgba(54, 162, 235, 0.5)',
                                    'rgba(255, 206, 86, 0.5)',
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                        }
                    });

                    var ctx3 = document.getElementById('pie-chart3').getContext('2d');
                    var data3 = @json($datosTicketsCategoriaTorta);
                    console.log(data3);
                    var myChart3 = new Chart(ctx3, {
                        type: 'pie',
                        data: {
                            labels: Object.keys(data3),
                            datasets: [{
                                label: 'Tickets',
                                data: Object.values(data3),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.5)',
                                    'rgba(54, 162, 235, 0.5)',
                                    'rgba(255, 206, 86, 0.5)',
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                        }
                    });

                    var ctx4 = document.getElementById('pie-chart4').getContext('2d');
                    var data4 = @json($dataEquipos);
                    console.log(data4);
                    var labels4 = data4.map(function(equipo) {
                        return equipo.nombre_equipo + ' (' + equipo.nombre_usuario + ')';
                    });
                    var values4 = data4.map(function(equipo) {
                        return equipo.total;
                    });

                    var myChart4 = new Chart(ctx4, {
                        type: 'pie',
                        data: {
                            labels: labels4,
                            datasets: [{
                                label: 'Equipos',
                                data: values4,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.5)',
                                    'rgba(54, 162, 235, 0.5)',
                                    'rgba(255, 206, 86, 0.5)',
                                    'rgba(75, 192, 192, 0.5)',
                                    'rgba(153, 102, 255, 0.5)',
                                    'rgba(255, 159, 64, 0.5)',
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                        }
                    });
                </script>
            </div>
        </div>
    </div>
</x-app-layout>