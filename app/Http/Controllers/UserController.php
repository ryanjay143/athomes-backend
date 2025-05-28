<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\IdentityDetailsModel;
use App\Models\PersonalInfoModel;
use App\Models\SalesEncoding;
use App\Models\PropertyListing;
use Carbon\Carbon;

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
        
        $topPerformers = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->get()
            ->groupBy(function ($item) {
                return $item->agent->personalInfo->first_name . ' ' .
                    $item->agent->personalInfo->middle_name . ' ' .
                    $item->agent->personalInfo->last_name . ' ' .
                    $item->agent->personalInfo->extension_name . ' ' .
                    $item->agent->user->role;
            })
            ->map(function ($group) {
                return [
                    'first_name' => $group->first()->agent->personalInfo->first_name,
                    'middle_name' => $group->first()->agent->personalInfo->middle_name,
                    'last_name' => $group->first()->agent->personalInfo->last_name,
                    'extension_name' => $group->first()->agent->personalInfo->extension_name,
                    'role' => in_array($group->first()->agent->user->role, [0, 2]) ? 'Broker' : 'Agent',
                    'totalReserved' => $group->count(),
                    'totalSales' => $group->sum('amount') 
                ];
            })
            ->sortByDesc('totalReserved');

        $salesEncodingTop5 = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->where('agent_id', $identityDetails->id)
            ->orderBy('created_at', 'desc')
            ->take(5)
            ->get();

            $salesEncoding = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->where('agent_id', $identityDetails->id)
            ->orderBy('created_at', 'desc')
            ->get();

        // Extract months from salesEncoding
        $monthsOfSale = $salesEncoding->map(function ($item) {
            return Carbon::parse($item->date_of_sale)->format('F');
        });

        $totalSales = $salesEncoding->sum('amount');

         $propertyListings = PropertyListing::with('propertyImages')
        ->orderBy('created_at', 'desc')
        ->get();

        return response()->json([
            'user' => $user,
            'personalInfo' => $personalInfo,
            'identityDetails' => $identityDetails,
            'topPerformers' => $topPerformers->values(),
            'salesEncoding' => $salesEncoding,
            'totalSales' => $totalSales,
            'monthsOfSale' => $monthsOfSale, 
            'property' => $propertyListings,
            'salesEncodingTop5' => $salesEncodingTop5,
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
            'images'           => 'nullable|array',
            'images.*'         => 'file|image|max:512000', 
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
