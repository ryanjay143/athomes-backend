<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DeveloperModel;
use App\Models\ProjectDetailsModel;
use App\Models\DeveloperImage;
use Illuminate\Support\Facades\Storage;

class DeveloperController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $developers = DeveloperModel::with('projects')->get();
        return response()->json([
            'developers' => $developers,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'dev_name' => 'required|string|max:255',
            'dev_email' => 'required|email|unique:developer,dev_email|max:255',
            'dev_phone' => 'required|string|max:15',
            'dev_location' => 'required|string|max:255',
            'projects' => 'required|array',
            'image' => 'required|file|mimes:jpeg,png,jpg,gif|max:2048',
            'projects.*.project_name' => 'required|string|max:255',
            'projects.*.project_location' => 'required|string|max:255',
            'projects.*.project_contact_person' => 'required|string|max:255',
        ]);

        $path = $request->file('image')->store('images', 'public');

        // Create the developer
        $developer = DeveloperModel::create([
            'dev_name' => $validatedData['dev_name'],
            'dev_email' => $validatedData['dev_email'],
            'dev_phone' => $validatedData['dev_phone'],
            'dev_location' => $validatedData['dev_location'],
            'image' => $path,
        ]);

        // Create associated projects
        foreach ($validatedData['projects'] as $projectData) {
            $developer->projects()->create($projectData);
        }

        return response()->json([
            'message' => 'Developer and projects created successfully',
            'developer' => $developer->load('projects'),
            'filePath' => Storage::url($path),
        ], 201);
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
