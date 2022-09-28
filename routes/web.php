<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\FlutterwaveController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\ShopsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Auth::routes();

Route::get('/', [ProductsController::class, 'index'])->name('index');
Route::get('/shop', [ShopsController::class, 'index'])->name('shop.index');
Route::get('/shop/{product}', [ShopsController::class, 'show'])->name('shop.show');

Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::post('/cart', [CartController::class, 'store'])->name('cart.store');
Route::delete('/cart/{product}/{cart}', [CartController::class, 'destroy'])->name('cart.destroy');

Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');

Route::post('/pay', [FlutterwaveController::class, 'initialize'])->name('pay');
Route::get('/rave/callback', [FlutterwaveController::class, 'callback'])->name('callback');

//Auth::routes();

//Admin
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/home/shop/create', [ShopsController::class, 'createIn'])->name('create.index');
Route::post('/home/shop/create', [ShopsController::class, 'create'])->name('shop.create');
Route::get('/home/shop/{edit}', [ShopsController::class, 'editIn'])->name('edit.index');
Route::post('/home/shop/{edit}', [ShopsController::class, 'edit'])->name('shop.edit');
Route::delete('/home/shop/{id}', [ShopsController::class, 'destroy'])->name('shop.delete');
