<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de tickets por categoria</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .details {
            text-align: center;
            margin-bottom: 20px;
        }
        .details p {
            margin: 5px 0;
            color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            color: #999;
        }
        .chart-container {
            margin-top: 20px;
            text-align: center;
        }
        .chart-container img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reporte de tickets por categoria</h2>
        <div class="details">
            <p>Fecha de impresión: {{ now()->format('d-m-Y') }}</p>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Categoria</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                @forelse($datosTicketsCategoria as $datosTicket)
                    <tr>
                        <td>{{ $datosTicket->nombre_categoria }}</td>
                        <td>{{ $datosTicket->total_categoria }}</td>
                    </tr>
                @empty
                    <tr>
                        <td class="no-data" colspan="2">No hay datos.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
        
    </div>
    
</body>
</html>
