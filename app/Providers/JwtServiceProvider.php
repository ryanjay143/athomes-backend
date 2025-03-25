<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\JwtMiddleware;

class JwtServiceProvider extends ServiceProvider
{
    public function register()
    {
        // Register services, if needed
    }

    public function boot()
    {
        // Register middleware
        Route::aliasMiddleware('auth.jwt', JwtMiddleware::class);
    }
}

