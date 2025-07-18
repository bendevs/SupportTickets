<?php

namespace App\Http\Controllers;

use App\Models\User;
use Coderflex\LaravelTicket\Models\Ticket;
use Spatie\Permission\Models\Role;


class DashboardController extends Controller
{
    public function __invoke()
    {
        $user = auth()->user(); 
        $roles = $user->getRoleNames();
        
        if ($roles->contains('admin')) {
            $totalTickets = Ticket::count();
            $openTickets = Ticket::where('status', 'abierto')->count();
            $closedTickets = Ticket::where('status', 'cerrado')->count();
        } elseif($roles->contains('agent')) {
            $totalTickets = Ticket::where('user_id', $user->id)->count();
            $openTickets = Ticket::where('status', 'abierto')->where('user_id', $user->id)->count();
            $closedTickets = Ticket::where('status', 'cerrado')->where('user_id', $user->id)->count();
        } elseif ($roles->contains('user')) {
            $totalTickets = Ticket::where('user_id', $user->id)->count();
            $openTickets = Ticket::where('status', 'abierto')->where('user_id', $user->id)->count();
            $closedTickets = Ticket::where('status', 'cerrado')->where('user_id', $user->id)->count();
        }
        return view('dashboard', compact('totalTickets', 'openTickets', 'closedTickets'));
    }
}