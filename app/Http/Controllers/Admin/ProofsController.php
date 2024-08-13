<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProofsController extends Controller
{
    public function index()
    {
        $proofs = UpgradeProof::with('user', 'membership')->get();
        return view('admin.proofs.index', compact('proofs'));
    }

    public function show($id)
    {
        $proof = UpgradeProof::findOrFail($id);
        return view('admin.proofs.show', compact('proof'));
    }

    public function approve($id)
    {
        $proof = UpgradeProof::findOrFail($id);
        $proof->status = 'approved';
        $proof->save();

        $user = User::find($proof->user_id);
        $user->membership_id = $proof->membership_id;
        $user->save();

        return redirect()->route('admin.proofs.index')->with('status', 'Proof approved and membership updated.');
    }

    public function cancel($id)
    {
        $proof = UpgradeProof::findOrFail($id);
        $proof->status = 'canceled';
        $proof->save();

        return redirect()->route('admin.proofs.index')->with('status', 'Proof canceled.');
    }
}
