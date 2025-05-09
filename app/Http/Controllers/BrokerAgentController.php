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
        $agents = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function($query) {
                $query->where('status', 1);
            })
            ->orderBy('created_at', 'desc')
            ->get();
       


        $agentsList = IdentityDetailsModel::with('user', 'personalInfo')
        ->whereHas('user', function($query) {
            $query->where('status', 0);
        })
        ->whereHas('user', function($query) {
            $query->whereIn('role', [1, 2]);
        })
        ->orderBy('created_at', 'desc')
        ->get();

        return response()->json([
            "agent" => $agents,
            "agentList" => $agentsList
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
    public function edit(string $id)
    {
        //
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
