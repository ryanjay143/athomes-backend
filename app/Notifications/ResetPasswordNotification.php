<?php

namespace App\Notifications;

use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPasswordNotification extends Notification
{
    public $token;

    public function __construct($token)
    {
        $this->token = $token;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        $frontendResetUrl = env('FRONTEND_RESET_PASSWORD_URL', 'https://www.athomesdashboard.com/reset-password');
        \Log::info('FRONTEND_RESET_PASSWORD_URL: ' . $frontendResetUrl);

        // Only urlencode the values, not the whole string
        $url = $frontendResetUrl
            . '?token=' . urlencode($this->token)
            . '&email=' . urlencode($notifiable->getEmailForPasswordReset());

        return (new MailMessage)
            ->subject('Reset Password Notification')
            ->view(
                'emails.password_reset',
                [
                    'url' => $url,
                ]
            );
    }
}