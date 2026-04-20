<?php

use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use Laravel\Fortify\Features;

Route::inertia('/', 'welcome', [
    'canRegister' => Features::enabled(Features::registration()),
])->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', function () {
        return inertia('dashboard', [
            'stats' => [
                'total_products' => \App\Models\Product::count(),
                'total_stock' => \App\Models\Product::sum('stock'),
                'total_value' => \App\Models\Product::selectRaw('SUM(stock * price) as total')->value('total') ?? 0,
            ]
        ]);
    })->name('dashboard');

    Route::resource('products', ProductController::class);
});

require __DIR__.'/settings.php';
