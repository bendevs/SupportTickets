<?php

namespace App\Http\Controllers;

use App\Models\Equipos;
use App\Models\User;
use Illuminate\Http\Request;

class EquiposControllers extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $equipos = Equipos::paginate();
        $usuarios = User::all();
        // dd($usuario);
        return view('equipos.index', compact('equipos', 'usuarios'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $usuarios = User::orderBy('name', 'asc')->get();
        $ipAddress = request()->ip() === '::1' ? '127.0.0.1' : request()->ip();
        return view('equipos.create', compact('usuarios', 'ipAddress'));
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
            "id_usuario" => "required",
            "nombre_equipo" => "required",
            "tipo" => "required",
            "area_unidad" => "required",
            "direccion_ip" => "required",
        ]);

        $idUsuario = $request->input('id_usuario');
        $tipoEquipo = $request->input('tipo');
        $areaUnidad = $request->input('area_unidad');
        $correoInstitucional = User::find($idUsuario)->email;
        // dd($correoInstitucional);
        $request->merge(['correo_institucional' => $correoInstitucional]);
        
        $equipoExistente = Equipos::where('id_usuario', $idUsuario)
                                  ->where('tipo', $tipoEquipo)
                                  ->first();
    
        
        if ($equipoExistente && $areaUnidad !== 'SISTEMAS') {
            return redirect()->back()->withErrors([
                'tipo' => 'El usuario ya tiene un equipo de este tipo.'
            ])->withInput();
        }
        // dd($request->all());
        Equipos::create($request->all());
        return redirect()->route('equipos.index')->with('success', 'Los datos del equipo se registraron correctamente');
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
    public function edit(Equipos $equipo)
    {
        $usuarios = User::orderBy('name', 'asc')->get();
        
        return view('equipos.edit', compact('usuarios', 'equipo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Equipos $equipo)
    {
        $request->validate([
            "id_usuario" => "required",
            "nombre_equipo" => "required",
            "tipo" => "required",
            "area_unidad" => "required",
            "correo_institucional" => "required",
        ]);
    
        $idUsuario = $request->input('id_usuario');
        $tipoEquipo = $request->input('tipo');
        $areaUnidad = $request->input('area_unidad');
    
        $equipoExistente = Equipos::where('id_usuario', $idUsuario)
                                  ->where('tipo', $tipoEquipo)
                                  ->where('id', '!=', $equipo->id)
                                  ->first();
    
        if ($equipoExistente && $areaUnidad !== 'SISTEMAS') {
            return redirect()->back()->withErrors([
                'tipo' => 'El usuario ya tiene un equipo de este tipo.'
            ])->withInput();
        }
    
        $equipo->update($request->all());
        return redirect()->route('equipos.index')->with('success', 'Equipo actualizado correctamente.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Equipos $equipo)
    {
        $equipo->delete();
        return redirect()->route('equipos.index')->with('success', 'Equipo eliminado correctamente.');
    }
}
