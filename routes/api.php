<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DeveloperController;
use App\Http\Controllers\BrokerAgentController;
use App\Http\Controllers\ImageUploadController;
use App\Http\Controllers\ProjectDetailsController;
use Tymon\JWTAuth\Facades\JWTAuth;

/*
|--------------------------------------------------------------------------
| Public API Routes
|--------------------------------------------------------------------------
| These routes are accessible without authentication.
*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

/*
|--------------------------------------------------------------------------
| Protected API Routes
|--------------------------------------------------------------------------
| These routes require authentication via the 'auth.jwt' middleware.
*/
Route::middleware(['auth.jwt'])->group(function () {

     /*
    |--------------------------------------------------------------------------
    | Admin Routes
    |--------------------------------------------------------------------------
    | Routes accessible only to users with the 'admin' role.
    */
    Route::apiResource('agent-broker', BrokerAgentController::class);


    /*
    |--------------------------------------------------------------------------
    | Agent-Broker Routes
    |--------------------------------------------------------------------------
    | Routes accessible only to users with the 'agent-broker' role.
    */
   
    Route::apiResource('developers', DeveloperController::class);
    Route::post('upload/image', [ImageUploadController::class, 'upload']);    


    /*
    |--------------------------------------------------------------------------
    | Authenticated User Routes
    |--------------------------------------------------------------------------
    | Routes accessible to any authenticated user.
    */
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    Route::get('/user', function (Request $request) {
        return response()->json(auth()->user());
    });
});