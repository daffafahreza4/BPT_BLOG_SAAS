<x-admin-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Manage Memberships') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h2 class="text-2xl font-semibold mb-4">Transfer Proof Details</h2>

                    <div class="mb-4">
                        <img src="{{ asset('storage/' . $proof->proof_image) }}" alt="Proof Image" class="max-w-full h-auto">
                    </div>

                    <p><strong>User:</strong> {{ $proof->user->name }}</p>
                    <p><strong>Membership:</strong> {{ $proof->membership->role }}</p>
                    <p><strong>Status:</strong> {{ ucfirst($proof->status) }}</p>
                    
                    <div class="mt-4">
                        @if ($proof->status === 'pending')
                            <form action="{{ route('admin.proofs.approve', $proof->id) }}" method="POST" class="inline-block">
                                @csrf
                                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg">Approve</button>
                            </form>
                            <form action="{{ route('admin.proofs.cancel', $proof->id) }}" method="POST" class="inline-block ml-2">
                                @csrf
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg">Cancel</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-admin-layout>