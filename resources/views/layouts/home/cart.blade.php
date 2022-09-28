@extends('layouts.app')
@section('content')
    <main class="main-wrap">
        <div style="margin-top: 2em;" class="l-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 offset-md-1">
                        <h3>{{ Cart::instance('default')->count() }} Item in Shopping Cart</h3>
                        <table class="table table-responsive">
                            <tbody>
                                @foreach (Cart::instance('default')->content() as $item)
                                    <tr>
                                        <td>
                                            <a href="{{ route('shop.show', $item->model->slug) }}">
                                                <img src="{{ productImage($item->model->image) }}" height="100px"
                                                    width="100px">
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{ route('shop.show', $item->model->slug) }}"
                                                class="text-decoration-none">
                                                <h3 class="lead light-text">{{ $item->model->name }}</h3>
                                                <p class="light-text">{{ $item->model->details }}</p>
                                            </a>
                                        </td>
                                        <td>
                                            <form action="{{ route('cart.destroy', [$item->rowId, 'default']) }}"
                                                method="POST" id="delete-item">
                                                @csrf()
                                                @method('DELETE')
                                            </form>
                                            <button class="btn btn-danger"
                                                onclick="document.getElementById('delete-item').submit();">Remove</button>
                                        </td>
                                        <td>
                                            <select class='quantity' data-id='{{ $item->rowId }}'
                                                data-productQuantity='{{ $item->model->quantity }}'>
                                                @for ($i = 1; $i < 10; $i++)
                                                    <option class="option" value="{{ $i }}"
                                                        {{ $item->qty == $i ? 'selected' : '' }}>{{ $i }}
                                                    </option>
                                                @endfor
                                            </select>
                                        </td>
                                        <td>${{ format($item->subtotal) }}</td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                        <hr>
                        <div class="summary" style="padding: 1em; background-color: #ddd;">
                            <div class="row">
                                <div class="col-md-8">
                                    <p class="light-text">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Est laborum perspiciatis
                                        ullam, aliquam eius deserunt iusto autem. Cumque omnis, architecto nostrum
                                        voluptatum quis temporibus alias suscipit quod reprehenderit. Quis, esse.
                                    </p>
                                </div>
                                <div class="col-md-3 offset-md-1">
                                    <p class="text-right light-text mb-2">Total &nbsp;
                                        &nbsp;${{ Cart::subtotal() }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="cart-actions mt-2">
                            <a class="btn btn-info" href="{{ route('index') }}">Continue
                                Shopping</a>
                            <a class="float-right btn btn-success custom-border-n" href="{{ route('checkout.index') }}">
                                Proceed to checkout
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
