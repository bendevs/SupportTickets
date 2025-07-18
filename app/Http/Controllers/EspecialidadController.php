<?php

namespace App\Http\Controllers;

use App\Models\Tecnico;
use Illuminate\Http\Request;

class EspecialidadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $especialidades = Tecnico::all();
        return view('especialidades.index', compact('especialidades'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('especialidades.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            "especialidad"=>"required",
            "caracteristica"=>"required",
        ]
        );
        Tecnico::create($request->all());
        return redirect()->route('especialidad.index')->with('success', 'Los datos de la especialidad registrado correctamente');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Tecnico $especialidad)
    {
        // dd($especialidad);
        return view('especialidades.edit', compact('especialidad'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($id);
        $request->validate([
            "especialidad" => "required",
            "caracteristica" => "required",
        ]);

        $especialidad = Tecnico::findOrFail($id);
        $especialidad->update($request->all());
        return redirect()->route('especialidad.index')->with('success', 'Los datos de la especialidad fueron actualizados correctamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tecnico $especialidad)
    {
        $especialidad->delete();
        return redirect()->route('especialidad.index')->with('success', 'Los datos de la especialidad eliminado');
    }
}
