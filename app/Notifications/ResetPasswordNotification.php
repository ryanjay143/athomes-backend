<?php

namespace App\Notifications;

use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPasswordNotification extends Notification
{
    public $token;

    /**
     * Create a notification instance.
     *
     * @param  string  $token
     * @return void
     */
    public function __construct($token)
    {
        $this->token = $token;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Build the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        // Get the base frontend URL from .env (no hash)
        $frontendBaseUrl = env('FRONTEND_RESET_PASSWORD_URL', 'http://localhost:5000');

        // Build the full reset password URL with hash fragment
        $url = $frontendBaseUrl
            . '/#/reset-password'
            . '?token=' . urlencode($this->token)
            . '&email=' . urlencode($notifiable->getEmailForPasswordReset());

        return (new \Illuminate\Notifications\Messages\MailMessage)
            ->subject('Reset Password Notification')
            ->view(
                'emails.password_reset',
                ['url' => $url]
            );
    }
}