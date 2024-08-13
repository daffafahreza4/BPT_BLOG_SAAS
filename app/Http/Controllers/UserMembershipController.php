<?php

namespace App\Http\Controllers;

use App\Models\Membership;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class UserMembershipController extends Controller
{
    public function index()
    {
        $memberships = Membership::all();
        $userMembershipId = auth()->user()->membership_id; // Ambil membership ID user yang sedang login
        $userId = Auth::id();

        // Check if the user has already uploaded proof for any memberships
        $userProofs = \App\Models\UpgradeProof::where('user_id', $userId)
            ->pluck('membership_id')
            ->toArray();
        return view('memberships.index', compact('memberships', 'userMembershipId','userProofs'));
    }

}
