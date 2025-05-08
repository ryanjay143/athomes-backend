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
        Schema::create('developer', function (Blueprint $table) {
            $table->id();
            $table->string('dev_name');
            $table->string('dev_email')->unique();
            $table->string('dev_phone');
            $table->string('dev_location');
            $table->string('image');
            $table->integer('status')->default(0)->comment("0 = active 1 = Inactive");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('developer');
    }
};
