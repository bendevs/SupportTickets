<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Ticket;
use Coderflex\LaravelTicket\Models\Label;
use Coderflex\LaravelTicket\Models\Category;
use App\Http\Requests\MessageRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Notification;
use App\Notifications\CommentEmailNotification;

class MessageController extends Controller
{
    public function store(MessageRequest $request, Ticket $ticket): RedirectResponse
    {
        if (auth()->user()->hasRole('user')) {
            return redirect()->route('tickets.index');
        }
        $message = $ticket->messages()->create($request->validated() + ['user_id' => auth()->user()->id]);

        $users = $ticket->messages()
            ->pluck('user_id')
            ->push($ticket->user_id)
            ->filter(fn ($user) => $user != auth()->user()->id)
            ->unique();

        Notification::send(User::findMany($users), new CommentEmailNotification($message));

        $labels = Label::visible()->pluck('name', 'id');

        $categories = Category::visible()->pluck('name', 'id');

        $users = User::role('agent')->orderBy('name')->pluck('name', 'id');

        return to_route('tickets.edit', compact('ticket', 'labels', 'categories', 'users'));

    }
}
