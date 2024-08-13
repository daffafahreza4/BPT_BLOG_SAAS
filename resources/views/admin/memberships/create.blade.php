<x-admin-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Create Membership') }}
        </h2>
    </x-slot>

    <style>
        input,textarea{
            border:1px solid gainsboro;
            padding:10px;
            margin-top: 10px;
        }
    </style>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <form action="{{ route('admin.memberships.store') }}" method="POST">
                        @csrf
                        <div class="mb-4">
                            <label for="role" class="block text-gray-700">Role</label>
                            <input type="text" name="role" id="role" class="w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div class="mb-4">
                            <label for="price" class="block text-gray-700">Price</label>
                            <input type="text" name="price" id="price" class="w-full border-gray-300 rounded-lg" required>
                        </div>
                        <div class="mb-4">
                            <label for="feature" class="block text-gray-700">Features</label>
                            <textarea name="feature" id="feature" rows="5" class="w-full border-gray-300 rounded-lg" required></textarea>
                        </div>
                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg">Create Membership</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-admin-layout>
