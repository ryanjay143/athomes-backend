<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\IdentityDetailsModel;
use App\Models\PersonalInfoModel;
use App\Models\SalesEncoding;
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

        $salesEncoding = SalesEncoding::with(['agent.user', 'agent.personalInfo'])
            ->where('agent_id', $identityDetails->id)
            ->orderBy('created_at', 'desc')
            ->take(5)
            ->get();

        // Extract months from salesEncoding
        $monthsOfSale = $salesEncoding->map(function ($item) {
            return Carbon::parse($item->date_of_sale)->format('F');
        });

        $totalSales = $salesEncoding->sum('amount');

        return response()->json([
            'user' => $user,
            'personalInfo' => $personalInfo,
            'identityDetails' => $identityDetails,
            'topPerformers' => $topPerformers->values(),
            'salesEncoding' => $salesEncoding,
            'totalSales' => $totalSales,
            'monthsOfSale' => $monthsOfSale, 
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
