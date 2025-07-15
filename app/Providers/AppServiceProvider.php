<?php

namespace App\Providers;

use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        ResetPassword::createUrlUsing(function (object $notifiable, string $token) {
            // Use config() instead of env() for cache safety
            $frontendUrl = config('frontend.url');
            // If your frontend expects /password-reset, append it, else use as is
            return "{$frontendUrl}?token={$token}&email={$notifiable->getEmailForPasswordReset()}";
        });
    }
}