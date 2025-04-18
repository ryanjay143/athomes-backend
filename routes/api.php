<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DeveloperController;
use App\Http\Controllers\BrokerAgentController;
use App\Http\Controllers\ImageUploadController;
use App\Http\Controllers\ProjectDetailsController;
use App\Http\Controllers\SalesEncodingController;
use App\Http\Controllers\PropertyListingController;
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
    Route::post('upload/image', [ImageUploadController::class, 'upload']);    
    Route::apiResource('projects', ProjectDetailsController::class);
    Route::apiResource('sales-encoding', SalesEncodingController::class);
    Route::apiResource('developers', DeveloperController::class);
    Route::apiResource('property-listings', PropertyListingController::class);

    /*
    |--------------------------------------------------------------------------
    | Agent-Broker Routes
    |--------------------------------------------------------------------------
    | Routes accessible only to users with the 'agent-broker' role.
    */
   
   
    
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