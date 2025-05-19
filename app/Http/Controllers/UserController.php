<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\IdentityDetailsModel;
use App\Models\PersonalInfoModel;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();
        $personalInfo = PersonalInfoModel::where('user_id', $user->id)->first();
        $identityDetails = IdentityDetailsModel::where('user_id', $user->id)->first();
        return response()->json([
            'user' => $user,
            'personalInfo' => $personalInfo,
            'identityDetails' => $identityDetails,
        ])->setStatusCode(200);
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
