<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reset Password</title>
</head>
<body style="font-family: Arial, sans-serif; background: #f8fafc; padding: 30px;">
    <div style="max-width: 480px; margin: auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 8px #e2e8f0; padding: 32px;">
        <div style="text-align: center; margin-bottom: 24px;">
            <img src="https://github.com/ryanjay143/atHomes/raw/master/public/logoathomes.jpg" alt="Logo" width="120" style="margin-bottom: 16px;">
        </div>
        <h2 style="color: #222;">Reset Password Notification</h2>
        <p>You are receiving this email because we received a password reset request for your account.</p>
        <div style="text-align: center; margin: 32px 0;">
            <a href="{{ $url }}" style="background: #3490dc; color: #fff; padding: 12px 32px; text-decoration: none; border-radius: 5px; font-weight: bold;">
                Reset Password
            </a>
        </div>
        <p>If you did not request a password reset, no further action is required.</p>
        <br>
        <p style="margin-top: 40px; text-align: center;">
            @if(isset($senderImageUrl))
                <img src="{{ $senderImageUrl }}" alt="Sender Avatar" width="64" height="64" style="border-radius: 50%; margin-bottom: 12px;">
                <br>
            @endif
            Best regards,<br>
            <strong>Aldin Tagolimot</strong><br>
            Broker
        </p>
    </div>
</body>
</html>