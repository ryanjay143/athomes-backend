<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SalesEncoding;
use App\Models\IdentityDetailsModel;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;

class SalesEncodingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $agents = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function ($query) {
                $query->where('status', 0)->where('role', 1);
            })
            ->orderBy('created_at', 'desc')
            ->get();

        $salesEncoding = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->orderBy('created_at', 'desc')
            ->get();
            
        return response()->json([
            'agents' => $agents, 
            'salesEncoding' => $salesEncoding
        ], 200);
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
        // Validate the request data
        $validatedData = $request->validate([
            'agent_id' => 'required|integer',
            'client_name' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'amount' => 'required|numeric',
            'location' => 'required|string|max:255',
            'remarks' => 'required|string',
            'date_on_sale' => 'required|date',
            'image' => 'required|file|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $salesEncoding = new SalesEncoding();
        $salesEncoding->agent_id = $validatedData['agent_id'];
        $salesEncoding->client_name = $validatedData['client_name'];
        $salesEncoding->category = $validatedData['category'];
        $salesEncoding->amount = $validatedData['amount'];
        $salesEncoding->location = $validatedData['location'];
        $salesEncoding->date_on_sale = $validatedData['date_on_sale'];
        $salesEncoding->remarks = $validatedData['remarks'];

        // Handle image upload
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('images', 'public');
            $salesEncoding->image = $path;
        }

        $salesEncoding->save(); // <-- Use save() for new records

        return response()->json(
            ['message' => 'Sales encoding created successfully', 'data' => $salesEncoding],
            201
        );
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
       
    }

    /**
     * Update the specified resource in storage.
     */
     public function update(Request $request, string $id)
    {
        try {
            // Validate incoming JSON data and image
            $validatedData = $request->validate([
                'category' => 'required|string',
                'amount' => 'required|numeric',
                'location' => 'required|string',
                'date_on_sale' => 'required|date',
                'client_name' => 'required|string',
                'remarks' => 'nullable|string',
                'agent_id' => 'required|exists:identity_details,id',
            ]);

            // Find the SalesEncoding record or fail
            $salesEncoding = SalesEncoding::findOrFail($id);

            // Update using fill() and save
            $salesEncoding->fill($validatedData)->save();

            // Return success response as JSON
            return response()->json([
                'message' => 'Sales encoding updated successfully',
                'data' => $salesEncoding
            ], 200);

        } catch (ValidationException $e) {
            // Return validation error in JSON
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            // Catch other errors like model not found, etc.
            return response()->json([
                'message' => 'An error occurred while updating',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    




    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $salesEncoding = SalesEncoding::findOrFail($id);
        $salesEncoding->delete();

        return response()->json([
            'message' => 'Sales encoding deleted successfully'
        ], 200);
       
    }
}
