<?php 

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Membership;
use Illuminate\Http\Request;

class MembershipController extends Controller
{
    public function index()
    {
        $memberships = Membership::all();
        return view('admin.memberships.index', compact('memberships'));
    }

    public function create()
    {
        return view('admin.memberships.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'role' => 'required|string|max:255',
            'price' => 'required|numeric',
            'feature' => 'required|string',
        ]);

        Membership::create($request->all());
        return redirect()->route('admin.memberships.index')
                         ->with('success', 'Membership created successfully.');
    }

    public function edit(Membership $membership)
    {
        return view('admin.memberships.edit', compact('membership'));
    }

    public function update(Request $request, Membership $membership)
    {
        $request->validate([
            'role' => 'required|string|max:255',
            'price' => 'required|numeric',
            'feature' => 'required|string',
        ]);

        $membership->update($request->all());
        return redirect()->route('admin.memberships.index')
                         ->with('success', 'Membership updated successfully.');
    }

    public function destroy(Membership $membership)
    {
        $membership->delete();
        return redirect()->route('admin.memberships.index')
                         ->with('success', 'Membership deleted successfully.');
    }
}
