<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\IdentityDetailsModel;
use App\Models\User;
use App\Models\PersonalInfoModel;

class BrokerAgentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pendingAgents = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 1);
            })
            ->orderBy('created_at', 'desc')
            ->get();

        $pendingAgentsCount = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 1);
            })
            ->orderBy('created_at', 'desc')
            ->count();
       


        $agentsList = IdentityDetailsModel::with('user', 'personalInfo')
        ->whereHas('user', function($query) {
            $query->where('status', 0);
        })
        ->whereHas('user', function($query) {
            $query->whereIn('role', [1, 2]);
        })
        ->orderBy('updated_at', 'desc')
        ->get();

        $agentsListCount = IdentityDetailsModel::with('user', 'personalInfo')
        ->whereHas('user', function($query) {
            $query->where('status', 0);
        })
        ->whereHas('user', function($query) {
            $query->whereIn('role', [1, 2]);
        })
        ->orderBy('updated_at', 'desc')
        ->count();

        $agentsLicensed = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 0);
            })
            ->whereHas('user', function($query) {
                $query->whereIn('role', [1, 2]);
            })
            ->where('prc_liscence_number', '!=', '') 
            ->orderBy('updated_at', 'desc')
            ->get();

        $agentsLicensedCount = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 0);
            })
            ->whereHas('user', function($query) {
                $query->whereIn('role', [1, 2]);
            })
            ->where('prc_liscence_number', '!=', '') 
            ->orderBy('updated_at', 'desc')
            ->count();

        $agentsUnlicensed = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 0);
            })
            ->whereHas('user', function($query) {
                $query->whereIn('role', [1, 2]);
            })
            ->where(function($query) {
                $query->whereNull('prc_liscence_number') // Ensures the field is null
                    ->orWhere('prc_liscence_number', ''); // Ensures the field is empty
            })
            ->orderBy('updated_at', 'desc')
            ->get();

            $agentsUnlicensedCount = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 0);
            })
            ->whereHas('user', function($query) {
                $query->whereIn('role', [1, 2]);
            })
            ->where(function($query) {
                $query->whereNull('prc_liscence_number') // Ensures the field is null
                    ->orWhere('prc_liscence_number', ''); // Ensures the field is empty
            })
            ->orderBy('updated_at', 'desc')
            ->count();



        return response()->json([
            "pendingAgents" => $pendingAgents,
            "agentList" => $agentsList,
            "agentsLicensed" => $agentsLicensed,
            "unlicensed" => $agentsUnlicensed,
            "agentsListCount" => $agentsListCount,
            "pendingAgentsCount" => $pendingAgentsCount,
            "agentsLicensedCount" => $agentsLicensedCount,
            "agentsUnlicensedCount" => $agentsUnlicensedCount
        ]);
   
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function editLicense(Request $request, string $id)
    {
        $validatedData = $request->validate([
            'prc_liscence_number' => 'required|string|max:255',
            'dhsud_registration_number' => 'required|string|max:255',
            'validation_date' => 'required|date',
            'role' => 'required|in:1,2',
        ]);

        $updateLicense = IdentityDetailsModel::findOrFail($id);
        $updateLicense->prc_liscence_number = $request->prc_liscence_number;
        $updateLicense->dhsud_registration_number = $request->dhsud_registration_number;
        $updateLicense->validation_date = $request->validation_date;

        // Update the role in the related User model
        $user = $updateLicense->user; // Assuming 'user' is the relationship name
        if ($user) {
            $user->role = $request->role;
            $user->save();
        }

        $updateLicense->save();

        return response()->json([
            "updateLicense" => $updateLicense,
            "message" => "License Updated Successfully"
        ]);
    }

   
    public function editType(Request $request, string $id)
    {
        $validatedData = $request->validate([
            'role' => 'required|in:1,2',
        ]);

        // Find the user by ID
        $user = User::find($id); // Assuming User model is used

        if ($user) {
            $user->role = $validatedData['role'];
            $user->save();

            return response()->json([
                "user" => $user,
                "message" => "Role Updated Successfully"
            ]);
        }

        return response()->json([
            "message" => "User not found"
        ], 404);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $user = User::findOrFail($id);
            $user->status = 0;
            $user->save();

            // Optionally log the deactivation
            \Log::info("User with ID {$id} has been Activated.");

            return response()->json([
                "user" => $user,
                "message" => "User Activate Success"
            ]);
        } catch (\Exception $e) {
            // Log the error
            \Log::error("Error deactivating user with ID {$id}: " . $e->getMessage());

            return response()->json([
                "error" => "An error occurred while deactivating the agent",
                "details" => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = IdentityDetailsModel::findOrFail($id);
        $user->delete();
        return response()->json([
            "message" => "Deleted successfully"
        ]);
    }
}
