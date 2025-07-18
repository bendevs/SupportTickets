<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Tickets por Estado</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Reporte de Tickets por Estado</h1>
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>Titulo</th>
                <th>Prioridad</th>
                <th>Estado</th>
                <th>Fecha de Creación</th>
                <th>Técnico</th>
            </tr>
        </thead>
        <tbody>
            @foreach($datosTicketsEstado as $ticket)
                <tr>
                    <td>{{ $ticket->id }}</td>
                    <td>{{ $ticket->title }}</td>
                    <td>{{ $ticket->priority }}</td>
                    <td>{{ $ticket->status }}</td>
                    <td>{{ $ticket->created_at }}</td>
                    <td>{{ $ticket->user->name }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <br><br>
    <div style="margin-top: 50px;">
        <div style="float: left; width: 45%; text-align: center;">
            <p>__________________________</p>
            <p>Firma del Técnico</p>
        </div>
        <div style="float: right; width: 45%; text-align: center;">
            <p>__________________________</p>
            <p>Sello</p>
        </div>
    </div>
</body>
</html>