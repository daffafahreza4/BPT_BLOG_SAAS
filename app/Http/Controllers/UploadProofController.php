<?php
// app/Http/Controllers/UploadProofController.php
namespace App\Http\Controllers;

use App\Models\Membership;
use App\Models\UpgradeProof;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UploadProofController extends Controller
{
    public function show(Membership $membership)
    {

        if($membership->id === 1){

            $user = User::find(Auth::id());
            $user->membership_id = $membership->id;
            $user->save();

            return redirect()->route('memberships')->with('success', 'Proof of transfer uploaded successfully.'); 
        }
        return view('memberships/upload-proof', compact('membership'));
    }

    public function store(Request $request, Membership $membership)
    {
        $request->validate([
            'proof' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'membership_id' => 'required|exists:memberships,id',
        ]);

        $path = $request->file('proof')->store('proofs', 'public');

        // Simpan data bukti transfer ke database
        UpgradeProof::create([
            'user_id' => Auth::id(),
            'membership_id' => $request->membership_id,
            'proof_image' => $path
        ]);

        return redirect()->route('memberships')->with('success', 'Proof of transfer uploaded successfully.');
    }
}
