<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tickets Generado - {{ $user->name }} Nro°: {{ $ticket->id }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            max-width: 800px;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
            color: #333;
            font-weight: bold;
        }
        td {
            color: #555;
        }
        .no-data {
            text-align: center;
            color: #999;
        }
        .print-date {
            margin-top: 20px;
            text-align: center;
            color: #777;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <h2>Reporte de Tickets por Técnico</h2>
    <div class="print-date">
        Fecha de impresión: {{ \Carbon\Carbon::now()->format('d/m/Y') }}
    </div>
    <table>
        <tr>
            <th>Usuario</th>
            <td>{{ $user->name }}</td>
        </tr>
        <tr>
            <th>Departamento</th>
            <td>{{ $ticket->departamento }}</td>
        </tr>
        <tr>
            <th>Tecnico Asignado</th>
            <td>{{ $userPersonal->name }}</td>
        </tr>
        <tr>
            <th>Id y Nombre de la Maquina</th>
            <td>{{ $equipos->id}} - {{ $equipos->nombre_equipo }} - {{$equipos->tipo}}</td>
        </tr>
        <tr>
            <th>Estado y Prioridad</th>
            <td>{{ $ticket->status}} - {{ $ticket->priority }}</td>
        </tr>
    </table>
    <table>
        <tr>
            <th colspan="2">Caracteristicas</th>
        </tr>
        <tr><td colspan="2">{{ str_replace(['<p>', '</p>'], '', $ticket->message) }}</td></tr>
        <tr>
            <th>Categorias</th>
            <td>
                @foreach($ticket->categories as $category)
                    <span>{{ $category->name }} - </span>
                @endforeach
            </td>
        </tr>
        <tr>
            <th>Etiquetas</th>
            <td>
                @foreach($ticket->labels as $label)
                    {{ $label->name }} -
                @endforeach
            </td>
        </tr>
    </table>
    <div style="margin-top: 10em">
        <br>
        <br>
        <br>
        <div style="text-align: center">________________________</div>
        <div style="text-align: center">{{ $userPersonal->name }}</div>
        {{-- <div style="text-align: center">FIRMA</div> --}}
    </div>
</body>
</html>
