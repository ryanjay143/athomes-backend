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
    public function index(Request $request)
    {
        $month = $request->query('month', Carbon::now()->month);
        $year = $request->query('year', Carbon::now()->year);

        // Calculate start and end of the selected month
        $startDate = Carbon::createFromDate($year, $month, 1)->startOfMonth()->startOfDay();
        $endDate = Carbon::createFromDate($year, $month, 1)->endOfMonth()->endOfDay();


        $user = auth()->user();
        $personalInfo = PersonalInfoModel::where('user_id', $user->id)->first();
        $identityDetails = IdentityDetailsModel::where('user_id', $user->id)->first();
        
        $topPerformers = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
    ->whereBetween('date_on_sale', [$startDate, $endDate])
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
            'profile_pic' => $group->first()->agent->personalInfo->profile_pic, // <-- Added line
            'role' => in_array($group->first()->agent->user->role, [0, 2]) ? 'Broker' : 'Agent',
            'totalReserved' => $group->count(),
            'totalSales' => $group->sum('amount') 
        ];
    })
    ->sortByDesc('totalSales');

        $salesEncodingTop5 = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->whereBetween('date_on_sale', [$startDate, $endDate])
            ->where('agent_id', $identityDetails->id)
            ->orderBy('created_at', 'desc')
            ->take(5)
            ->get();

        $salesEncoding = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
        ->where('agent_id', $identityDetails->id)
        ->orderBy('created_at', 'desc')
        ->get();

        $salesEncodingReport = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
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
            'salesEncodingReport' => $salesEncodingReport,
        ])->setStatusCode(200);
    }

    public function editProfileAgent(Request $request)
    {
        $validatedData = $request->validate([
            'username' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'password' => 'nullable|string|min:8|confirmed',
            'profile_pic' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120',
            'first_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'last_name' => 'required|string|max:255',
            'extension_name' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'complete_address' => 'nullable|string|max:255',
        ]);

        // Get the authenticated user
        $user = auth()->user();

        if (!$user) {
            return response()->json(['error' => 'User not authenticated'], 401);
        }

        // Update the user fields
        $user->username = $validatedData['username'];
        $user->email = $validatedData['email'];

        // Update the user's password if provided
        if (!empty($validatedData['password'])) {
            $user->password = bcrypt($validatedData['password']);
        }

        // Save the updated user information
        $user->save();

        // Find the personal info record by user ID
        $personalInfo = PersonalInfoModel::where('user_id', $user->id)->first();

        if (!$personalInfo) {
            return response()->json(['error' => 'Personal information not found'], 404);
        }

        // Update the personal info fields
        $personalInfo->first_name = $validatedData['first_name'];
        $personalInfo->middle_name = $validatedData['middle_name'];
        $personalInfo->last_name = $validatedData['last_name'];
        $personalInfo->extension_name = $validatedData['extension_name'];
        $personalInfo->phone = $validatedData['phone'];
        $personalInfo->complete_address = $validatedData['complete_address'];

            if ($request->hasFile('profile_pic')) {
            // Check if there's an existing profile picture and delete it
            if ($personalInfo->profile_pic) {
                $oldImagePath = public_path($personalInfo->profile_pic);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath); // Delete the old image file
                }
            }

            $file = $request->file('profile_pic');
            $filename = time() . '_' . $file->getClientOriginalName(); // Create a unique filename
            $destinationPath = public_path('profile_pic'); // Define the destination path in the public directory

            // Move the file to the public directory
            $file->move($destinationPath, $filename);

            // Save the path to the personal info model
            $personalInfo->profile_pic = 'profile_pic/' . $filename;
        }

        // Save the updated personal info
        $personalInfo->save();

        // Return a JSON response
        return response()->json([
            "user" => auth()->user(),
            "personalInfo" => $personalInfo,
            "message" => "Profile updated successfully"
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
