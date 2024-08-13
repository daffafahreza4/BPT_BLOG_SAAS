<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Membership Plans') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h2 class="text-2xl font-semibold mb-4">Available Membership Plans</h2>

                    <div class="flex flex-wrap -mx-4">
                        @foreach ($memberships as $membership)
                        <div class="w-full md:w-1/3 px-4 mb-6">
                             <div class="p-6 rounded-lg shadow-lg w-1/3" style="background: {{ $loop->iteration === 1 ? '#cfe2ff' : ($loop->iteration === 2 ? 'gold' : '#f8d7da') }}; width: 100%;">
                                <h3 class="text-xl font-bold mb-4">{{ $membership->role }}</h3>
                                <p class="text-2xl font-extrabold mb-4">Rp. {{ number_format($membership->price, 2) }}</p>
                                <ul class="mb-6">
                                    @foreach (explode(';', $membership->feature) as $feature)
                                    <li class="mb-2">✅ {{ $feature }}</li>
                                    @endforeach
                                </ul>
                                @if (in_array($membership->id, $userProofs))
                                    <button class="bg-gray-500 text-white px-4 py-2 rounded-lg" disabled>Sedang Menunggu Validasi</button>
                                @else
                                    @if ($userMembershipId !== $membership->id)
                                        <a href="{{ route('upload-proof.show', $membership->id) }}" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">Select {{ $membership->role }}</a>
                                    @endif
                                @endif
                                
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>


