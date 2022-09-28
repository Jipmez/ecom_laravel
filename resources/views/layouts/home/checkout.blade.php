@extends('layouts.app')
@section('content')
    <main class="main-wrap  mt-5 mb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-5 offset-md-1">
                    <hr>
                    <h1 class="lead" style="font-size: 1.5em">Checkout</h1>
                    <hr>
                    <h3 class="lead" style="font-size: 1.2em; margin-bottom: 1.6em;">Billing details</h3>
                    <form action="{{ route('pay') }}" method="POST">
                        @csrf
                        <input type="hidden" name="amount" value="{{ Cart::subtotal() }}">
                        <div class="form-group">
                            <label for="email" class="light-text">Email Address</label>
                            <input type="text" name="email" class="form-control my-input" required>
                        </div>
                        <div class="form-group">
                            <label for="name" class="light-text">Name</label>
                            <input type="text" name="name" class="form-control my-input" required>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="light-text">Phone</label>
                            <input type="number" name="phone" class="form-control my-input" required>
                        </div>
                        <button type="submit" class="btn btn-success custom-border-success btn-block">Complete
                            Order</button>
                    </form>
                </div>
                <div class="col-md-5 offset-md-1">
                    <hr>
                    <h3>Your Order</h3>
                    <hr>
                    <table class="table table-borderless table-responsive">
                        <tbody>
                            @foreach (Cart::instance('default')->content() as $item)
                                <tr>
                                    <td>
                                        <a href="{{ route('shop.show', $item->model->slug) }}">
                                            <img src="{{ productImage($item->model->image) }}" height="100px"
                                                width="100px">
                                    </td>
                                    </a>
                                    <td>
                                    <td>
                                        <a href="{{ route('shop.show', $item->model->slug) }}" class="text-decoration-none">
                                            <h3 class="lead light-text">{{ $item->model->name }}</h3>
                                            <p class="light-text">{{ $item->model->details }}</p>
                                            <h3 class="light-text lead text-small">${{ format($item->model->price) }}</h3>
                                        </a>
                                    </td>
                                    <td>
                                        <span class="quantity-square">{{ $item->qty }}</span>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <hr>

                    <div class="row">
                        <div class="col-md-4">
                            <span>Total</span>
                        </div>
                        <div class="col-md-4 offset-md-4">
                            <span class="text-right" style="display: inline-block">${{ $total }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
