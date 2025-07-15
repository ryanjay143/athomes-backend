<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckUserRole
{
    public function handle(Request $request, Closure $next, $role)
    {
        if (!Auth::check()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $userRole = Auth::user()->role;

        // If the required role is 2 (broker), allow both 2 (broker) and 0 (admin)
        if ((int)$role === 2) {
            if ($userRole === 2 || $userRole === 0) {
                return $next($request);
            }
        }

        // For all other roles, require exact match
        if ($userRole === (int)$role) {
            return $next($request);
        }

        return response()->json(['message' => 'Unauthorized'], 403);
    }
}