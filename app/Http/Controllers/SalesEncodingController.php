<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SalesEncoding;
use App\Models\IdentityDetailsModel;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Collection;
use Carbon\Carbon;

class SalesEncodingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $agents = IdentityDetailsModel::with('user', 'personalInfo')
            ->whereHas('user', function ($query) {
                $query->where('status', 0)->whereIn('role', [1,2]);
            })
            ->orderBy('created_at', 'desc')
            ->get();

        $salesEncoding = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->orderBy('created_at', 'desc')
            ->get();

        $salesEncodingReports = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->orderBy('created_at', 'asc')
            ->get();

        $currentMonth = Carbon::now()->month;
        $currentYear = Carbon::now()->year;

        $salesdashboard = SalesEncoding::select('id', 'category', 'created_at')
            ->whereMonth('created_at', $currentMonth)
            ->whereYear('created_at', $currentYear)
            ->orderBy('created_at', 'asc')
            ->get();

        // Group by category and merge entries
        $mergedSales = $salesdashboard->groupBy('category')->map(function (Collection $group) {
            return [
                'category' => $group->first()->category,
                'totalReserved' => $group->count() // Count the number of merged entries
            ];
        });
            
        $topPerformers = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
        ->get()
        ->groupBy(function ($item) {
            return $item->agent->personalInfo->first_name . ' ' .
                $item->agent->personalInfo->middle_name . ' ' .
                $item->agent->personalInfo->last_name . ' ' .
                $item->agent->personalInfo->extension_name . ' ' .
                $item->agent->user->role;
        })
        ->map(function (Collection $group) {
            return [
                'first_name' => $group->first()->agent->personalInfo->first_name,
                'middle_name' => $group->first()->agent->personalInfo->middle_name,
                'last_name' => $group->first()->agent->personalInfo->last_name,
                'extension_name' => $group->first()->agent->personalInfo->extension_name,
                'role' => in_array($group->first()->agent->user->role, [0, 2]) ? 'Broker' : 'Agent', // Correct role mapping
                'totalReserved' => $group->count(),
                'totalSales' => $group->sum('amount') // Calculate total sales for each agent
            ];
        })
        ->sortByDesc('totalReserved');

        return response()->json([
            'agents' => $agents, 
            'salesEncoding' => $salesEncoding,
            'salesEncodingReports' => $salesEncodingReports,
            'salesdashboard' => $mergedSales->values(),
            'topPerformers' => $topPerformers->values()
        
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

    // Create a new SalesEncoding instance
    $salesEncoding = new SalesEncoding();
    $salesEncoding->fill([
        'agent_id' => $validatedData['agent_id'],
        'client_name' => $validatedData['client_name'],
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

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
       
    }

    /**
     * Update the specified resource in storage.
     */
     public function updateSalesEncoding(Request $request, string $id)
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
                'image' => 'nullable|image|max:5120',
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
