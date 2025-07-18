<?php

namespace App\Services;

use ConsoleTVs\Charts\Classes\Highcharts\Chart;
use Illuminate\Support\Facades\Storage;

class ChartService
{
    public function generateChart()
    {
        // Crear el gráfico utilizando Charts::create
        $chart = new Chart;
        $chart->labels(['Enero', 'Febrero', 'Marzo'])
              ->dataset('Datos de Ejemplo', 'line', [100, 200, 150]);

        // Definir la ruta donde se guardará la imagen
        $filename = 'chart_' . uniqid() . '.png';
        $path = 'charts/' . $filename;

        // Guardar el gráfico como imagen en almacenamiento público
        // Necesitas asegurarte de tener permisos para escribir en este directorio
        Storage::disk('public')->put($path, $chart->api_url);

        // Devolver la URL pública del archivo generado
        return Storage::url($path);
    }
}
