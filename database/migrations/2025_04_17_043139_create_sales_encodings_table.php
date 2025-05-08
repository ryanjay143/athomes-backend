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
        Schema::create('sales_encodings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('agent_id')->constrained('identity_details');
            $table->string('category');
            $table->string('client_name');
            $table->date('date_on_sale');
            $table->decimal('amount');
            $table->string('location');
            $table->string('remarks');
            $table->string('image');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales_encodings');
    }
};
