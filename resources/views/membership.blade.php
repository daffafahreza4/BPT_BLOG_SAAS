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
                    <div class="flex justify-center space-x-6" style="gap:10px;">
                        <!-- Free Membership Card -->
                        <div class="bg-blue-100 p-6 rounded-lg shadow-lg text-center w-1/3" style=width:100%>
                            <h3 class="text-2xl font-bold mb-4">Free</h3>
                            <p class="text-3xl font-extrabold mb-4">$0 <span class="text-sm">/ month</span></p>
                            <ul class="mb-6 text-left">
                                <li class="mb-2">✅ Access to basic features</li>
                                <li class="mb-2">✅ Limited support</li>
                                <li>✅ Community access</li>
                            </ul>
                            <button class="bg-blue-600 text-white px-4 py-2 rounded-lg mt-4 hover:bg-blue-600 transition">Choose Free</button>
                        </div>

                        <!-- Gold Membership Card -->
                        <div class="bg-gold-100 p-6 rounded-lg shadow-lg text-center w-1/3" style="background:gold;width: 100%;">
                            <h3 class="text-2xl font-bold mb-4">Gold</h3>
                            <p class="text-3xl font-extrabold mb-4">$19.99 <span class="text-sm">/ month</span></p>
                            <ul class="mb-6 text-left">
                                <li class="mb-2">✅ All Free features</li>
                                <li class="mb-2">✅ Priority support</li>
                                <li>✅ Access to premium content</li>
                            </ul>
                            <button class="bg-red-500 text-white px-4 py-2 rounded-lg mt-4 hover:bg-yellow-600 transition">Choose Gold</button>
                        </div>

                        <!-- Premium Membership Card -->
                        <div class="bg-red-100 p-6 rounded-lg shadow-lg text-center w-1/3" style=width:100%>
                            <h3 class="text-2xl font-bold mb-4">Premium</h3>
                            <p class="text-3xl font-extrabold mb-4">$49.99 <span class="text-sm">/ month</span></p>
                            <ul class="mb-6 text-left">
                                <li class="mb-2">✅ All Gold features</li>
                                <li class="mb-2">✅ Dedicated support</li>
                                <li>✅ Exclusive offers</li>
                            </ul>
                            <button class="bg-red-500 text-white px-4 py-2 rounded-lg mt-4 hover:bg-red-600 transition">Choose Premium</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
