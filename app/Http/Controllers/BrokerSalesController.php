<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SalesEncoding;
use Illuminate\Validation\ValidationException;
use App\Models\IdentityDetailsModel;
use App\Models\PersonalInfoModel;
use App\Models\User;
use Carbon\Carbon;


class BrokerSalesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
            'block_and_lot' => 'nullable|string|max:255',
            'category' => 'required|string|max:255',
            'amount' => 'required|numeric',
            'location' => 'required|string|max:255',
            'remarks' => 'required|string',
            'date_on_sale' => 'required|date',
            'image' => 'required|file|mimes:jpeg,png,jpg,gif|max:5120',
        ]);

        // Create a new SalesEncoding instance
        $salesEncoding = new SalesEncoding();
        $salesEncoding->fill([
            'agent_id' => $validatedData['agent_id'],
            'client_name' => $validatedData['client_name'],
            'block_and_lot' => $validatedData['block_and_lot'],
            'category' => $validatedData['category'],
            'amount' => $validatedData['amount'],
            'location' => $validatedData['location'],
            'date_on_sale' => $validatedData['date_on_sale'],
            'remarks' => $validatedData['remarks'],
        ]);

        // Handle the image upload
        $image = $request->file('image');
        $imageName = time() . '_' . $image->getClientOriginalName();
        $image->move(public_path('images'), $imageName);
        $salesEncoding->image = 'images/' . $imageName;

        // Save the SalesEncoding record
        $salesEncoding->save();

        // Return a JSON response
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

    public function updateSalesEncodingBroker(Request $request, string $id)
    {
        try {
            // Validate incoming JSON data and image
            $validatedData = $request->validate([
                'category' => 'required|string',
                'amount' => 'required|numeric',
                'location' => 'required|string',
                'date_on_sale' => 'required|date',
                'client_name' => 'required|string',
                'block_and_lot' => 'nullable|string|max:255',
                'remarks' => 'nullable|string',
                'agent_id' => 'required|exists:identity_details,id',
                'image' => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
            ]);

            // Find the SalesEncoding record or fail
            $salesEncoding = SalesEncoding::findOrFail($id);

            // Handle image upload if present
            if ($request->hasFile('image')) {
                // Remove old image if exists
                if ($salesEncoding->image && file_exists(public_path($salesEncoding->image))) {
                    unlink(public_path($salesEncoding->image));
                }

                // Upload new image
                $image = $request->file('image');
                $imageName = time() . '_' . $image->getClientOriginalName();
                $image->move(public_path('images'), $imageName);
                $validatedData['image'] = 'images/' . $imageName;
            }

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
