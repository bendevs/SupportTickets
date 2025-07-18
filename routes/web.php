<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LabelController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\DownloadAttachmentController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\EquiposControllers;
use App\Http\Controllers\EspecialidadController;
use App\Http\Controllers\estadoEquipocontroller;
use App\Http\Controllers\personalEspecialidadController;


Route::get('/', function () {
    return view('welcome');
});


require __DIR__.'/auth.php';

Route::middleware(['auth'])->group(function () {
    Route::get('/', DashboardController::class)->middleware(['role:admin|agent'])->name('dashboard');

    Route::get('profile', [ProfileController::class, 'show'])->name('profile.show');
    Route::put('profile', [ProfileController::class, 'update'])->name('profile.update');

    Route::post('tickets/upload', [TicketController::class, 'upload'])->name('tickets.upload');
    Route::patch('tickets/{ticket}/close', [TicketController::class, 'close'])->name('tickets.close');
    Route::patch('tickets/{ticket}/reopen', [TicketController::class, 'reopen'])->name('tickets.reopen');
    Route::patch('tickets/{ticket}/archive', [TicketController::class, 'archive'])->name('tickets.archive');
    Route::post('tickets/{ticket}/report', [TicketController::class, 'report'])->name('tickets.report');
    Route::resource('tickets', TicketController::class);
    Route::post('tickets/{ticket}/califique', [TicketController::class, 'clasificate'])->name('tickets.clasificate');
    Route::get('fechasDeTickets', [TicketController::class, 'fechasDeTickets'])->name('fechasDeTickets');


    Route::middleware('role:admin')->group(function () {
        Route::resource('users', UserController::class)->except('show');

        Route::get('activities', ActivityController::class)->name('activities');
        Route::get('reporte', [ActivityController::class,'reporte'])->name('activities.reporte');
        Route::get('grafica', [ActivityController::class,'grafica'])->name('activities.grafica');
        Route::resource('especialidad', EspecialidadController::class);
        Route::resource('personalEspecialidad', personalEspecialidadController::class);
        Route::post('/tickets/autoassign', [TicketController::class, 'autoassign'])->name('tickets.autoassign');
        Route::resource('equipos', EquiposControllers::class);
        Route::resource('estadoEquipo', estadoEquipocontroller::class);
        Route::resource('categories', CategoryController::class)->middleware('role:admin');
        // Route::resource('labels', LabelController::class)->middleware('role:admin');
        Route::get('generate-pdf-tickets-tecnico',[PDFController::class,'generatePDFTicketsTecnico'])->name('generatePDFTicketsTecnico.pdf');
        Route::get('generate-pdf-tickets-departamento',[PDFController::class,'generatePDFTicketsDepartamento'])->name('generatePDFTicketsDepartamento.pdf');
        Route::get('generate-pdf-tickets-categoria',[PDFController::class,'generatePDFTicketsCategoria'])->name('generatePDFTicketsCategoria.pdf');
        Route::get('generate-pdf-tickets-EquiposIncidencia',[PDFController::class,'generatePDFTicketsEquiposIncidencia'])->name('generatePDFTicketsEquiposIncideincias.pdf');
        Route::get('generate-pdf-tickets-Prioridad',[PDFController::class,'generatePDFTicketsEstado'])->name('generatePDFTicketsEstado.pdf');
        Route::get('generate-pdf-tickets-fecha',[PDFController::class,'generatePDFTicketsFecha'])->name('generatePDFTicketsFecha.pdf');
        Route::get('/search', [CommentController::class, 'search'])->name('search');
        Route::get('/Valoraciones', [TicketController::class, 'listaValoracion'])->name('Tickets.listaValoracion');
    });

    Route::post('messages/{ticket}', [MessageController::class, 'store'])->name('message.store');

    Route::get('download/attachment/{mediaItem}', DownloadAttachmentController::class)->name('attachment-download');
});
