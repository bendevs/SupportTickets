<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Http\Requests\CategoryRequest;
use App\Models\personal_especialidad;
use App\Models\Tecnico;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::paginate();
        $tecnico = Tecnico::all();
        // dd($categories);
        
        return view('categories.index', compact('categories', 'tecnico'));
    }

    public function create()
    {
        $tecnico = Tecnico::all();
        // return view('categories.create');
        return view('categories.create', compact('tecnico'));
    }

    public function store(CategoryRequest $request)
    {
        // dd($request);
        Category::create($request->validated());

        return to_route('categories.index');
    }

    public function show(Category $category) {}

    public function edit(Category $category)
    {
        $tecnico = Tecnico::all();
        return view('categories.edit', compact('category', 'tecnico'));
    }

    public function update(CategoryRequest $request, Category $category)
    {
        // dd($request);
        $category->update($request->all());
        return to_route('categories.index');
    }

    public function destroy(Category $category)
    {
        $category->delete();

        return to_route('categories.index');
    }
}