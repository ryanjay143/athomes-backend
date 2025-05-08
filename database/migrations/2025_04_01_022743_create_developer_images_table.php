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
        Schema::create('developer_images', function (Blueprint $table) {
            $table->id();
            $table->foreignId('developer_id')->constrained('developer')->onDelete('cascade');
            $table->string('image'); // Store the path to the image
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('developer_images');
    }
};
