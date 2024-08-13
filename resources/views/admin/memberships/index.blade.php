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
                    <a href="{{ route('admin.memberships.create') }}" class="bg-blue-500 text-white px-4 py-2 rounded-lg mb-4 inline-block hover:bg-blue-600 transition">Create Membership</a>

                    <table class="min-w-full bg-white border border-gray-200">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="py-3 px-6 border-b">Role</th>
                                <th class="py-3 px-6 border-b">Price</th>
                                <th class="py-3 px-6 border-b">Features</th>
                                <th class="py-3 px-6 border-b">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($memberships as $membership)
                            <tr class="{{ $loop->even ? 'bg-gray-50' : 'bg-white' }} hover:bg-gray-100 transition">
                                <td class="py-3 px-6 border-b">{{ $membership->role }}</td>
                                <td class="py-3 px-6 border-b">${{ number_format($membership->price, 2) }}</td>
                                <td class="py-3 px-6 border-b">{{ $membership->feature }}</td>
                                <td class="py-3 px-6 border-b flex space-x-2">
                                    <a href="{{ route('admin.memberships.edit', $membership->id) }}" class="bg-yellow-500 text-white px-4 py-2 rounded-lg hover:bg-yellow-600 transition">Edit</a>
                                    <form action="{{ route('admin.memberships.destroy', $membership->id) }}" method="POST" class="inline-block">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition">Delete</button>
                                    </form>
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
