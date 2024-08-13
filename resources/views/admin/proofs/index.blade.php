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
                    <h2 class="text-2xl font-semibold mb-4">Manage Bukti Transfer</h2>

                    <table class="min-w-full bg-white border border-gray-200 rounded-lg shadow-md">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="py-3 px-6 text-left text-gray-600">User</th>
                                <th class="py-3 px-6 text-left text-gray-600">Membership</th>
                                <th class="py-3 px-6 text-left text-gray-600">Proof Image</th>
                                <th class="py-3 px-6 text-left text-gray-600">Status</th>
                                <th class="py-3 px-6 text-left text-gray-600">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($proofs as $proof)
                            <tr class="{{ $loop->odd ? 'bg-gray-50' : 'bg-white' }} hover:bg-gray-100">
                                <td class="py-3 px-6 text-gray-700">{{ $proof->user->name }}</td>
                                <td class="py-3 px-6 text-gray-700">{{ $proof->membership->role }}</td>
                                <td class="py-3 px-6 text-gray-700">
                                    <a href="{{ route('admin.proofs.show', $proof->id) }}" class="text-blue-500 hover:underline">View</a>
                                </td>
                                <td class="py-3 px-6 text-gray-700">{{ ucfirst($proof->status) }}</td>
                                <td class="py-3 px-6">
                                    @if ($proof->status === 'pending')
                                        <div class="flex space-x-2">
                                            <form action="{{ route('admin.proofs.approve', $proof->id) }}" method="POST">
                                                @csrf
                                                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600">Approve</button>
                                            </form>
                                            <form action="{{ route('admin.proofs.cancel', $proof->id) }}" method="POST">
                                                @csrf
                                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">Cancel</button>
                                            </form>
                                        </div>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</x-admin-layout>