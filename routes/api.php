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
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\ResetPasswordController; // Ensure this is the correct namespace
use Tymon\JWTAuth\Facades\JWTAuth;

/*
|--------------------------------------------------------------------------
| Public API Routes
|--------------------------------------------------------------------------
| These routes are accessible without authentication.
*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/forgot-password', [PasswordResetLinkController::class, 'store'])
    ->middleware('guest')
    ->name('password.email');

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
    Route::put('editLicense/{id}', [BrokerAgentController::class, 'editLicense']);
    Route::post('updateSalesEncoding/{id}', [SalesEncodingController::class, 'updateSalesEncoding']);
    Route::apiResource('projects', ProjectDetailsController::class);
    Route::apiResource('sales-encoding', SalesEncodingController::class);
    Route::apiResource('developers', DeveloperController::class);
    Route::apiResource('property-listings', PropertyListingController::class);
    Route::post('admin/addProject', [DeveloperController::class, 'addProjects']);    

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