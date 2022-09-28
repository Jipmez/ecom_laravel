<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use Cart;
use Illuminate\Http\Request;
use KingFlamez\Rave\Facades\Rave as Flutterwave;

class FlutterwaveController extends Controller
{
    //

    public function initialize()
    {
        if ($this->productsAreNoLongerAvailable()) {
            return back()->withError('Sorry, one of the items on your cart is no longer available');
        }
        $reference = Flutterwave::generateReference();
        $data = [
            'payment_options' => 'card',
            'amount' => 200, //(int) preg_replace("/([^0-9\\.])/i", "", request()->amount),
            'email' => request()->email,
            'tx_ref' => $reference,
            'currency' => "NGN",
            'redirect_url' => route('callback'),
            'customer' => [
                'email' => request()->email,
                "phone" => request()->phone,
                "name" => request()->name,
            ],

            "customizations" => [
                "title" => 'New order',
            ],
        ];
        $payment = Flutterwave::initializePayment($data);
        if ($payment['status'] !== 'success') {
            session()->flash('error', 'payment error');
            return;
        }
        return redirect($payment['data']['link']);
    }

    public function callback()
    {
        $status = request()->status;
        if ($status == 'successful') {
            $transactionID = Flutterwave::getTransactionIDFromCallback();
            $data = Flutterwave::verifyTransaction($transactionID);
            try {
                $order = $this->insertIntoOrdersTable($data, null);
                $this->decreaseQuantities();
                Cart::instance('default')->destroy();
                return redirect()->route('index')->with('success', 'Your order is completed successfully!');
            } catch (Exception $e) {
                $this->insertIntoOrdersTable($data, $e->getMessage());
                return back()->withError('Error ' . $e->getMessage());
            }
        } elseif ($status == 'cancelled') {
            return redirect()->route('index')->with('error', 'Your order has been cancelled!');
        } else {
            return redirect()->route('index')->with('error', 'Ordr failed!');
        }
    }

    private function insertIntoOrdersTable($request, $error)
    {
        $order = Order::create([
            'user_id' => auth()->user() ? auth()->user()->id : null,
            'billing_email' => $request['data']['customer']['email'],
            'billing_name' => $request['data']['customer']['name'],
            'billing_phone' => '09898239', //$request->phone,
            'billing_total' => $request['data']['amount'],
            'error' => $error,
        ]);

        foreach (Cart::instance('default')->content() as $item) {
            OrderProduct::create([
                'product_id' => $item->model->id,
                'order_id' => $order->id,
                'quantity' => $item->qty,
            ]);
        }
        return $order;
    }

    private function decreaseQuantities()
    {
        foreach (Cart::instance('default')->content() as $item) {
            $product = Product::find($item->model->id);
            $product->update(['quantity' => $product->quantity - $item->qty]);
        }
    }

    private function productsAreNoLongerAvailable()
    {
        foreach (Cart::instance('default')->content() as $item) {
            $product = Product::find($item->model->id);
            if ($product->quantity < $item->qty) {
                return true;
            }
        }
        return false;
    }
}
