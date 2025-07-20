<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PropertyListing; 
use Illuminate\Support\Str;
use App\Models\PropertyImages;

class PropertyListingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $propertyListings = PropertyListing::with('propertyImages')
        ->orderBy('created_at', 'desc')
        ->get();

        return response()->json([
            'property' => $propertyListings,
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
        // Validate the incoming request data, including multiple images
        $validated = $request->validate([
            'category'         => 'required|string|max:255',
            'price_and_rate'   => 'nullable|numeric',
            'date_listed'      => 'required|date',
            'lot_area'         => 'required|numeric',
            'floor_area'       => 'required|numeric',
            'details'          => 'nullable|string',
            'location'         => 'required|string|max:255',
            'type_of_listing'  => 'required|string|max:255',
            'status'           => 'required|string|max:255',
            'images'   => 'nullable|array',
            'images.*' => 'file|image|mimes:jpg,jpeg,png|max:5120',
        ]);

        // Store the validated data (excluding images)
        $propertyListing = PropertyListing::create([
            'category'        => $validated['category'],
            'price_and_rate'  => $validated['price_and_rate'],
            'date_listed'     => $validated['date_listed'],
            'lot_area'        => $validated['lot_area'],
            'floor_area'      => $validated['floor_area'],
            'details'         => $validated['details'],
            'location'        => $validated['location'],
            'type_of_listing' => $validated['type_of_listing'],
            'status'          => $validated['status'],
        ]);

        // Handle images if provided (multiple file uploads)
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $imageFile) {
                $filename = time() . '_' . $imageFile->getClientOriginalName();
                $imageFile->move(public_path('property_images'), $filename);
                $propertyListing->propertyImages()->create([
                    'images' => 'property_images/' . $filename,
                ]);
            }
        }

        // Reload with images
        $propertyListing->load('propertyImages');

        // Return a response (JSON example)
        return response()->json([
            'message' => 'Property listing created successfully.',
            'property'    => $propertyListing,
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
    
    

     public function update(Request $request, $id)
    {
        // Validate the incoming request data, including multiple images
        $validated = $request->validate([
            'category'         => 'required|string|max:255',
            'price_and_rate'   => 'nullable|numeric',
            'date_listed'      => 'required|date',
            'lot_area'         => 'required|numeric',
            'floor_area'       => 'required|numeric',
            'details'          => 'nullable|string',
            'location'         => 'required|string|max:255',
            'type_of_listing'  => 'required|string|max:255',
            'status'           => 'required|string|max:255',
            'images'   => 'nullable|array',
            'images.*' => 'file|image|mimes:jpg,jpeg,png|max:5120',
        ]);

        // Find the property listing
        $propertyListing = PropertyListing::findOrFail($id);

        // Update the property listing fields
        $propertyListing->update([
            'category'        => $validated['category'],
            'price_and_rate'  => $validated['price_and_rate'],
            'date_listed'     => $validated['date_listed'],
            'lot_area'        => $validated['lot_area'],
            'floor_area'      => $validated['floor_area'],
            'details'         => $validated['details'] ?? null,
            'location'        => $validated['location'],
            'type_of_listing' => $validated['type_of_listing'],
            'status'          => $validated['status'],
        ]);

        // Handle images if provided (multiple file uploads)
        if ($request->hasFile('images')) {
            // Store new images directly under the public directory
            foreach ($request->file('images') as $imageFile) {
                $filename = time() . '_' . $imageFile->getClientOriginalName();
                $path = public_path('property_images');
                $imageFile->move($path, $filename);
                $propertyListing->propertyImages()->create([
                    'images' => 'property_images/' . $filename,
                ]);
            }
        }

        // Reload with images
        $propertyListing->load('propertyImages');

        // Return a response (JSON example)
        return response()->json([
            'message' => 'Property listing updated successfully.',
            'property' => $propertyListing,
        ], 200);
    }
        





    /**
     * Remove the specified resource from storage.
     */
   public function destroy(string $id)
    {
        // Find the property listing
        $propertyListing = PropertyListing::findOrFail($id);

        // Delete the associated images
        $propertyListing->propertyImages()->delete();

        // Delete the property listing itself
        $propertyListing->delete();

        return response()->json([
            'message' => 'Property listing and associated images deleted successfully.',
        ], 200);
    }
}
