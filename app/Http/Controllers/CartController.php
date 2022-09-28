<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Cart;

class CartController extends Controller
{
    //

    public function index()
    {
        $mightLike = Product::mightAlsoLike()->get();
        return view('layouts/home/cart')->with('mightLike', $mightLike);
    }

    public function store()
    {
        $duplicates = Cart::instance('default')->search(function ($cartItem, $rowId) {
            return $cartItem->id == request()->id;
        });
        $duplicatesLater = Cart::instance('saveForLater')->search(function ($cartItem, $rowId) {
            return $cartItem->id == request()->id;
        });
        if ($duplicates->isNotEmpty()) {
            session()->flash('success', 'Item is already in your cart');
            return redirect()->route('cart.index');
        } else if ($duplicatesLater->isNotEmpty()) {
            Cart::instance('saveForLater')->remove($duplicatesLater->first()->rowId);
        }
        Cart::instance('default')->add(request()->id, request()->name, 1, request()->price)->associate('App\Models\Product');
        session()->flash('success', 'product added to the cart');
        return redirect()->route('cart.index');

    }

    public function destroy($id, $cart)
    {
        if ($cart == 'default') {
            Cart::instance('default')->remove($id);
        }
        session()->flash('success', 'item has been removed');
        return back();
    }
}
