<?php

namespace App\Http\Controllers;

use Cart;

class CheckoutController extends Controller
{
    //

    public function index()
    {
        if (Cart::instance('default')->count() > 0) {
            $subtotal = Cart::instance('default')->subtotal() ?? 0;
            return view('layouts/home/checkout')->with([
                'total' => $subtotal,
            ]);
        }
        return redirect()->route('cart.index')->withError('You have nothing in your cart , please add some products first');
    }
}
