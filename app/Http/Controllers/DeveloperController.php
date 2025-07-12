<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DeveloperModel;
use App\Models\PropertyListing;
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
        $developers = DeveloperModel::with('projects')
        ->orderBy('created_at', 'desc')
        ->get();


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
            'image' => 'required|file|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Move the image to the public/developer_images directory
        $image = $request->file('image');
        $imageName = time() . '_' . $image->getClientOriginalName();
        $image->move(public_path('developer_images'), $imageName);

        // Create the developer
        $developer = DeveloperModel::create([
            'dev_name' => $validatedData['dev_name'],
            'dev_email' => $validatedData['dev_email'],
            'dev_phone' => $validatedData['dev_phone'],
            'dev_location' => $validatedData['dev_location'],
            'image' => 'developer_images/' . $imageName,
        ]);

        return response()->json([
            'message' => 'Developer created successfully',
            'developer' => $developer,
            'filePath' => url('developer_images/' . $imageName),
        ], 201);
    }

    public function addProjects(Request $request)
    {
        $validatedData = $request->validate([
            'projects' => 'required|array',
            'projects.*.developer_id' => 'required|exists:developer,id',
            'projects.*.project_name' => 'required|string|max:255',
            'projects.*.project_location' => 'required|string|max:255',
            'projects.*.project_category' => 'required|string|max:255',
            'projects.*.status' => 'required|string|max:255',
            'projects.*.total_units' => 'required|numeric',
        ]);
    
        $projects = [];
        foreach ($validatedData['projects'] as $projectData) {
            $projectData['available_units'] = $projectData['total_units'];
            $projects[] = ProjectDetailsModel::create($projectData);
        }
    
        return response()->json([
            'message' => 'Projects added successfully',
            'projects' => $projects,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    public function searchProperties(Request $request)
    {
        $validatedData = $request->validate([
            'location' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'price_and_rate' => 'nullable|numeric',
        ]);

        $location = $validatedData['location'];
        $category = $validatedData['category'];
        $priceAndRate = $validatedData['price_and_rate'];

        $query = PropertyListing::with('propertyImages')
                                ->where('location', $location)
                                ->where('category', $category);

        if (!is_null($priceAndRate)) {
            $query->where('price_and_rate', $priceAndRate);
        }

        $properties = $query->get();

        if ($properties->isEmpty()) {
            return response()->json(['message' => 'Property not found'], 404);
        }

        return response()->json($properties);
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
    public function updateDeveloper(Request $request, string $id)
{
    $validatedData = $request->validate([
        'dev_name' => 'required|string|max:255',
        'dev_email' => 'required|email|unique:developer,dev_email,' . $id . '|max:255',
        'dev_phone' => 'required|string|max:15',
        'dev_location' => 'required|string|max:255',
        'image' => 'nullable|file|mimes:jpeg,png,jpg,gif|max:5120', 
    ]);

    $developer = DeveloperModel::find($id);
    if (!$developer) {
        return response()->json(['message' => 'Developer not found'], 404);
    }

    if ($request->hasFile('image')) {
        // Delete the old image if it exists
        if ($developer->image && file_exists(public_path($developer->image))) {
            unlink(public_path($developer->image));
        }

        // Move the new image to the public/developer_images directory
        $image = $request->file('image');
        $imageName = time() . '_' . $image->getClientOriginalName();
        $image->move(public_path('developer_images'), $imageName);
        $developer->image = 'developer_images/' . $imageName;
    }

    $developer->dev_name = $validatedData['dev_name'];
    $developer->dev_email = $validatedData['dev_email'];
    $developer->dev_phone = $validatedData['dev_phone'];
    $developer->dev_location = $validatedData['dev_location'];
    $developer->save();

    return response()->json([
        'message' => 'Developer updated successfully',
        'developer' => $developer,
    ], 200);
}
        

    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
