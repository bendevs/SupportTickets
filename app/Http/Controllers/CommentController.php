<?php

namespace App\Http\Controllers;
use App\Models\Messages;
use App\Http\Requests\CommentRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class CommentController extends Controller
{
    public function create()
    {
        return view('categories.create');
    }

    public function store(CommentRequest $request)
    {
        Comment::create($request->validated());

        return to_route('categories.index');
    }
    
    public function search(Request $request)
    {
        $query = $request->input('query');

        $comments = DB::select(DB::raw("SELECT * FROM messages
        INNER JOIN tickets ON messages.ticket_id = tickets.id
        INNER JOIN users ON users.id = messages.user_id
        WHERE messages.message LIKE :query"), ['query' => '%' . $query . '%']);
        
        return view('tickets.search_results', ['comments' => $comments, 'query' => $query]);
    }
}
