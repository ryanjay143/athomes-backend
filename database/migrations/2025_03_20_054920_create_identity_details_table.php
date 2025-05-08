<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('identity_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // Define the user_id column
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade'); 
            $table->string('prc_liscence_number');
            $table->string('dhsud_registration_number');
            $table->string('validation_date')->nullable();
            $table->string('last_school_att');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('identity_details');
    }
};
