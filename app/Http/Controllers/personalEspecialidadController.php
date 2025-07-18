<?php

namespace App\Http\Controllers;

use App\Models\personal_especialidad;
use App\Models\Tecnico;
use App\Models\User;
use Illuminate\Http\Request;

class personalEspecialidadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $personalEspecialidad = personal_especialidad::paginate();
        $usuarios=User::all();
        $tecnicos=Tecnico::all();
        return view("personalEspecialidad.index", compact("personalEspecialidad", "usuarios", "tecnicos"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $usuarios=User::all();
        $tecnicos=Tecnico::all();
        return view("personalEspecialidad.create", compact('usuarios', "tecnicos"));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            "id_especialidades"=>"required",
            "id_users"=>"required",
            "fecha_inicio"=>"required",
        ]);

        $existingSpecialty = personal_especialidad::where('id_users', $request->id_users)->first();
        if ($existingSpecialty) {
            return redirect()->back()->withErrors(['id_users' => 'El usuario ya tiene una especialidad asignada.']);
        }

        personal_especialidad::create($request->all());
        return redirect()->route('personalEspecialidad.index')->with('success', 'Los datos del personal se agregaron correctamente');
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
    public function edit($personal)
    {
        
        $usuarios=User::all();
        $tecnicos=Tecnico::all();
        $personal=personal_especialidad::where("id", $personal)->first();
        // dd($personal);
        return view("personalEspecialidad.edit", compact('usuarios', "tecnicos", "personal"));
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
        // dd($request);
        $request->validate([
            "id_especialidades"=>"required",
            "id_users"=>"required",
            "fecha_inicio"=>"required",
        ]);

        $existingSpecialty = personal_especialidad::where('id_users', $request->id_users)->where('id', '!=', $id)->first();
        if ($existingSpecialty) {
            return redirect()->back()->withErrors(['id_users' => 'El usuario ya tiene una especialidad asignada.']);
        }

        $especialidad = personal_especialidad::findOrFail($id);
        $especialidad->update($request->all());
        return redirect()->route('personalEspecialidad.index')->with('success', 'Los datos del personal fueron actualizados correctamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($personal)
    {
        $personal = personal_especialidad::find($personal);
        // dd($personal);
        $personal->delete();
        return redirect()->route('personalEspecialidad.index')->with('success', 'Se elimino la asignación del personal correctamente.');
    }
}
