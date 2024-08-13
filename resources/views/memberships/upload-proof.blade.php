<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Bukti Transfer') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h2 class="text-2xl font-semibold mb-4">Upload Bukti Transfer</h2>

                    <form action="{{ route('upload-proof.store', $membership->id) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="membership_id" value="{{ $membership->id }}">

                        <div class="mb-4">
                            <input type="file" id="proof" name="proof" class="mt-1 block w-full">
                        </div>

                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>