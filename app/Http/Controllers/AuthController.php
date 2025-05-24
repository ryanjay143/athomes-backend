<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Models\PersonalInfoModel;
use App\Models\IdentityDetailsModel;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        // Validate the incoming request data
        $data = $request->validate([
            'username' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email|max:255',
            'acct_number' => 'required|string|max:255',
            'password' => 'required|string|min:8',
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'phone' => 'required|string|max:15',
            'gender' => 'required|string|max:15',
            'complete_address' => 'required|string|max:500',
            'last_school_att' => 'required|string|max:255',
            'role' => 'required|string|max:255',
            'validation_date' => 'nullable|date_format:d-m-Y',
            'prc_liscence_number' => 'nullable|string|max:255',
            'extension_name' => 'nullable|string|max:255',
            'dhsud_registration_number' => 'nullable|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'profile_pic' => 'nullable|string|max:255',
        ]);

        try {
            // Create the user
            $user = User::create([
                'username' => $data['username'],
                'email' => $data['email'],
                'acct_number' => $data['acct_number'],
                'password' => Hash::make($data['password']),
                'status' => 1, // Default status
                'role' => $data['role'],
            ]);

            // Create associated personal info
            $personalInfo = PersonalInfoModel::create([
                'user_id' => $user->id,
                'first_name' => $data['first_name'],
                'middle_name' => $data['middle_name'] ?? '',
                'last_name' => $data['last_name'],
                'extension_name' => $data['extension_name'] ?? '',
                'phone' => $data['phone'],
                'gender' => $data['gender'],
                'complete_address' => $data['complete_address'],
                'profile_pic' => $data['profile_pic'] ?? '',
            ]);

            // Create associated identity details
            $identityDetails = IdentityDetailsModel::create([
                'user_id' => $user->id,
                'prc_liscence_number' => $data['prc_liscence_number'] ?? '',
                'dhsud_registration_number' => $data['dhsud_registration_number'] ?? '',
                'validation_date' => $data['validation_date'] ?? null,
                'last_school_att' => $data['last_school_att'],
            ]);

            // Return a success response
            return response()->json([
                'message' => 'Registration successful',
                'user' => [
                    'id' => $user->id,
                    'username' => $user->username,
                    'email' => $user->email,
                    'acct_number' => $user->acct_number,
                    'status' => $user->status,
                ],
                'personal_info' => $personalInfo,
                'identity_details' => $identityDetails,
            ], 201);

        } catch (\Exception $e) {
            // Handle any unexpected errors
            return response()->json([
                'message' => 'Registration failed',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function login(Request $request)
    {
        // Validate the incoming request
        $credentials = $request->validate([
            'credential' => 'required|string', // Can be email or username
            'password' => 'required|string|min:8',
        ]);

        // Determine if the credential is an email or username
        $fieldType = filter_var($credentials['credential'], FILTER_VALIDATE_EMAIL) ? 'email' : 'username';

        // Check if the user exists with the given email or username
        $user = User::where($fieldType, $credentials['credential'])->first();

        if (!$user) {
            return response()->json(['message' => ucfirst($fieldType) . ' is invalid'], 401);
        }

        // Check if the password is correct
        if (!Auth::attempt([$fieldType => $credentials['credential'], 'password' => $credentials['password']])) {
            return response()->json(['message' => 'Password is invalid'], 401);
        }

        // Check if the user's status is 1 (pending approval)
        if ($user->status == 1) {
            return response()->json(['message' => 'Your account is still in process. Please wait for approval.'], 403);
        }

        // Create a token for the user
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Login successful',
            'user' => $user,
            'access_token' => $token,
        ], 200);
    }

    public function logout(Request $request)
    {
        // Revoke the current token for the authenticated user
        // $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Successfully logged out'], 200);
    }

    public function me(Request $request)
    {
        return response()->json(['user' => $request->user()], 200);
    }
}