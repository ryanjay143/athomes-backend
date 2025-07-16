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
        // Get the base frontend URL from .env (no hash or fragment)
        $frontendBaseUrl = env('FRONTEND_RESET_PASSWORD_URL', 'https://www.athomesdashboard.com');

        // Build the full reset password URL with hash fragment
        $url = rtrim($frontendBaseUrl, '/')
            . '/#/reset-password'
            . '?token=' . urlencode($this->token)
            . '&email=' . urlencode($notifiable->getEmailForPasswordReset());

        // Example: static sender image (ensure this exists in public/images)
        $senderImageUrl = asset('images/sender-avatar.png'); // Update path as needed

        return (new MailMessage)
            ->subject('Reset Password Notification')
            ->view(
                'emails.password_reset',
                [
                    'url' => $url,
                    'senderImageUrl' => $senderImageUrl,
                ]
            );
    }
}