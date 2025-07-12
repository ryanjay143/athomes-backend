<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DeveloperController;
use App\Http\Controllers\BrokerAgentController;
use App\Http\Controllers\ImageUploadController;
use App\Http\Controllers\ProjectDetailsController;
use App\Http\Controllers\SalesEncodingController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PropertyListingController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\BrokerController;
use App\Http\Controllers\UserSalesController;
use App\Http\Controllers\BrokerSalesController;

use Illuminate\Http\Request;


Route::middleware(['throttle:api'])->group(function () {

    /*
    |--------------------------------------------------------------------------
    | Public API Routes
    |--------------------------------------------------------------------------
    | These routes are accessible without authentication.
    */
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('forgot-password', [PasswordResetLinkController::class, 'store'])
        ->middleware('guest')
        ->name('password.reset');
    Route::post('reset-password', [NewPasswordController::class, 'store'])
        ->middleware('guest')
        ->name('password.store');

    

    /*
    |--------------------------------------------------------------------------
    | Protected API Routes
    |--------------------------------------------------------------------------
    | These routes require authentication via the 'auth:sanctum' middleware.
    */
    Route::middleware(['auth:sanctum'])->group(function () {
        // User routes
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::get('/me', [AuthController::class, 'me']);
        Route::get('/user', function (Request $request) {
            return response()->json(auth()->user());
        });

        /*
        |--------------------------------------------------------------------------
        | Admin Routes
        |--------------------------------------------------------------------------
        | Routes accessible only to users with the 'admin' role (role = 0).
        */
        Route::middleware(['role:0'])->group(function () {
            Route::apiResource('agent-broker', BrokerAgentController::class);
            Route::post('updateRole/{id}', [BrokerAgentController::class, 'updateRole']);
            Route::post('upload/image', [ImageUploadController::class, 'upload']);  
            Route::put('editLicense/{id}', [BrokerAgentController::class, 'editLicense']);
            Route::put('editType/{id}', [BrokerAgentController::class, 'editType']);
            Route::post('updateSalesEncoding/{id}', [SalesEncodingController::class, 'updateSalesEncoding']);
            Route::post('updateDeveloper/{id}', [DeveloperController::class, 'updateDeveloper']);
            Route::apiResource('projects', ProjectDetailsController::class);
            Route::apiResource('sales-encoding', SalesEncodingController::class);
            Route::apiResource('developers', DeveloperController::class);
            Route::apiResource('property-listings', PropertyListingController::class);
            Route::post('admin/addProject', [DeveloperController::class, 'addProjects']); 
            Route::post('admin/edit-profile', [BrokerAgentController::class, 'editProfileAdmin']);

            Route::post('admin/search-properties/{id}', [DeveloperController::class, 'searchProperties']);

            Route::get('admin/housingCategory', [DeveloperController::class, 'searchCategory']);
            Route::get('admin/housingLocation', [DeveloperController::class, 'searchLocation']);
        });


         /*
        |--------------------------------------------------------------------------
        | Agent Routes
        |--------------------------------------------------------------------------
        | Routes accessible only to users with the 'agent/broker' role (role = [1,2]).
        */
        Route::middleware(['role:1'])->group(function () {
            Route::apiResource('user/agent-broker', UserController::class);
            Route::post('agent/edit-profile', [UserController::class, 'editProfileAgent']);
            Route::apiResource('user/agent-sales', UserSalesController::class);
            Route::post('updateSalesEncodingAgent/{id}', [UserSalesController::class, 'updateSalesEncoding']);
        });

         /*
        |--------------------------------------------------------------------------
        | Broker Routes
        |--------------------------------------------------------------------------
        | Routes accessible only to users with the 'agent/broker' role (role = [1,2]).
        */
        Route::middleware(['role:2'])->group(function () {
            Route::apiResource('user/broker', BrokerController::class);
            Route::post('broker/edit-profile', [BrokerController::class, 'editProfileBroker']);
            Route::apiResource('user/broker-sales', BrokerSalesController::class);
            Route::post('updateSalesEncodingBroker/{id}', [BrokerSalesController::class, 'updateSalesEncodingBroker']);
        });
    });
});
