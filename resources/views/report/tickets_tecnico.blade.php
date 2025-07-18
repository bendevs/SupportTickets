<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Tickets por Técnico</title>
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
        <thead>
            <tr>
                <th>Técnico</th>
                <th>Total</th>
                <th>Tickets Abiertos</th>
                <th>Tickets Cerrados</th>
                <th>Tickets Archivados</th>
            </tr>
        </thead>
        <tbody>
            @forelse($datosTicketsPorTecnico as $datosTicket)
                <tr>
                    <td>{{ $datosTicket['user']['name'] }}</td>
                    <td>{{ $datosTicket['total_tickets'] }}</td>
                    <td>{{ $datosTicket['total_abiertos'] }}</td>
                    <td>{{ $datosTicket['total_cerrados'] }}</td>
                    <td>{{ $datosTicket['total_archivados'] }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" class="no-data">No hay datos.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
    <h2>Detalle de Tickets</h2>
    <table>
        <thead>
            <tr>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Estado</th>
                <th>Prioridad</th>
                <th>Categoria</th>
                <th>Etiquetas</th>
                <th>Departamento</th>
                <th>Fecha de Creacion</th>
                <th>Asignado a</th>
            </tr>
        </thead>
        <tbody>
            @forelse($tickets as $ticket)
                <tr>
                    <td>{{ $ticket->title }}</td>
                    <td>{{ $ticket->user->name }}</td>
                    <td>{{ $ticket->status }}</td>
                    <td>{{ $ticket->priority }}</td>
                    <td>
                        @foreach($ticket->categories as $category)
                            {{ $category->name }}
                        @endforeach
                    </td>
                    <td>
                        @foreach($ticket->labels as $label)
                            {{ $label->name }}
                        @endforeach
                    </td>
                    <td>
                        {{ $ticket->departamento }}
                    </td>
                    <td>
                        {{ $ticket->created_at }}
                    </td>
                    <td>
                        {{ $ticket->assignedToUser->name ?? '' }}
                    </td>
                    
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="no-data">No hay datos.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
   
</body>
</html>
