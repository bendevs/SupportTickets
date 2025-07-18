<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Tickets por Departamento</title>
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
    <h2>Reporte de Tickets por Departamento</h2>
    <div class="print-date">
        Fecha de impresión: {{ \Carbon\Carbon::now()->format('d/m/Y') }}
    </div>
    <table>
        <thead>
            <tr>
                <th>Departamento</th>
                <th>Total</th>
                <th>Tickets Abiertos</th>
                <th>Tickets Cerrados</th>
                <th>Tickets Archivados</th>
            </tr>
        </thead>
        <tbody>
            @forelse($datosTicketsPorDepartamento as $datosTicket)
                <tr>
                    <td>{{ $datosTicket['departamento'] }}</td>
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
    
</body>
</html>
