<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte semanal de los Tickets</title>
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
    <h2>Reporte de los Ticktes Semanales </h2>
    <div class="print-date">
        @php
            $startOfWeek = \Carbon\Carbon::now()->startOfWeek()->format('d/m/Y');
            $endOfWeek = \Carbon\Carbon::now()->endOfWeek()->format('d/m/Y');
        @endphp
        Reporte de la semana entre: {{ $startOfWeek }} - {{ $endOfWeek }}
    </div>
    @forelse($tickets as $ticket)
    <table>
        <thead>
            <tr>
                <th>Id Ticket</th>
                <th>Usuario</th>
                <th>Técnico</th>
                <th>Estado</th>
                <th>Fecha Estado</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>{{ $ticket->id }}</td>
                    <td>@foreach ($usuarios as $usuario)
                        @if ($usuario->id == $ticket->user_id)
                            {{$usuario->name}}
                        @endif
                    @endforeach</td>
                    <td>@foreach ($usuarios as $tecnico)
                        @if ($tecnico->id == $ticket->assigned_to)
                            {{$tecnico->name}}
                        @endif
                    @endforeach</td>
                    <td>{{ $ticket->status }}</td>
                    <td>{{ $ticket->fecha_soporte }}</td>
                </tr>
        </tbody>
    </table>
    @empty
        <tr>
            <td colspan="5" class="no-data">No hay datos.</td>
        </tr>
    @endforelse
</body>
</html>
