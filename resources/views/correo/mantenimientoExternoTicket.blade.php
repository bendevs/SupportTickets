<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mantenimiento Externo del Ticket</title>
</head>
<body>
    <div style="font-family: Arial, sans-serif; margin: 0 auto; padding: 20px; max-width: 600px; border: 1px solid #ddd;">
        <h2 style="color: #333;">Actualización de Ticket</h2>
        <p>Estimado/a {{ $usuario->name }},</p>
        <p>Nos complace informarle que los datos de su ticket han sido actualizados con la siguiente información:</p>
        <ul>
            <li><strong>ID del Ticket:</strong> {{ $ticket->id }}</li>
            <li><strong>Técnico:</strong> {{ $nombreTecnico->name }}</li>
            <li><strong>Asunto:</strong> {{ $ticket->title }}</li>
            <li><strong>Fecha de Actualización:</strong> {{ $ticket->updated_at }}</li>
        </ul>
        <p>El mantenimiento de su máquina se está realizando fuera de nuestras instalaciones. Para mayor información, por favor póngase en contacto con el técnico designado.</p>
        <p>Gracias por su paciencia y colaboración.</p>
        <p>Atentamente,</p>
        <p>El equipo de soporte</p>
    </div>
</body>
</html>