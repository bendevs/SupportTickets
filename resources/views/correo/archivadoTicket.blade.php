<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ticket Archivado</title>
</head>
<body>
    <div style="font-family: Arial, sans-serif; margin: 0 auto; padding: 20px; max-width: 600px; border: 1px solid #ddd;">
        <h2 style="color: #333;">Ticket Archivado</h2>
        <p>Estimado/a {{ $usuario->name }},</p>
        <p>Su ticket ha sido archivado con la siguiente información:</p>
        <ul>
            <li><strong>ID del Ticket:</strong> {{ $ticket->id }}</li>
            <li><strong>Tecnico:</strong> {{ $nombreTecnico->name }}</li>
            <li><strong>Asunto:</strong> {{ $ticket->title }}</li>
            <li><strong>Fecha de Creación:</strong> {{ $ticket->created_at }}</li>
            <li><strong>Fecha de Archivado:</strong> {{ $ticket->updated_at }}</li>
        </ul>
        <p>Nos pondremos en contacto con usted lo antes posible.</p>
        <p>Gracias por su paciencia.</p>
        <p>Atentamente,</p>
        <p>El equipo de soporte</p>
    </div>
</body>
</html>