<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $tableName = config('laravel_ticket.table_names.tickets', 'tickets');
        Schema::table($tableName, function (Blueprint $table) {
            $table->string('departamento')->after('assigned_to')->nullable();
            $table->timestamp('fecha_soporte')->after('departamento')->nullable();
        });

        //
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $tableName = config('laravel_ticket.table_names.tickets', 'tickets');
        Schema::table($tableName, function (Blueprint $table) {
            $table->dropColumn('departamento');
            $table->dropColumn('fecha_soporte');
        });
    }
};
