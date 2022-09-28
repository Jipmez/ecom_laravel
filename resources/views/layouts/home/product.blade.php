@extends('layouts.app')
@section('title', $product->name)
@section('content')
    <main class="main-wrap">
        <article>
            <div class="l-content in-post">
                <div class="l-wrapper in-post  js-aos-wrapper" data-aos="fade-up" data-aos-delay="300">
                    <div class="l-post-content js-progress-content">
                        <header class="m-heading">
                            <h1 class="m-heading__title in-post">{{ $product->slug }}</h1>
                            <div class="m-heading__meta">
                                <span class="m-heading__meta__divider" aria-hidden="true">&bull;</span>
                            </div>
                        </header>
                        <div class="row">
                            <div class="col-md-5">

                                <figure class="kg-card kg-image-card"><img src="{{ productImage($product->image) }}"
                                        class="kg-image js-zoomable medium-zoom-image" alt="" loading="lazy"
                                        width="100%" height="100%" srcset="{{ productImage($product->image) }}"
                                        sizes="(min-width: 720px) 720px"></figure>

                                {{-- <div class="image-thumbnails">
                                    @if ($images)
                                        <img src="{{ productImage($product->image) }}" class="image-thumbnail active">
                                        @foreach ($images as $image)
                                            <div>
                                                <img src="{{ productImage($image) }}" class="image-thumbnail">
                                            </div>
                                        @endforeach
                                    @endif
                                </div> --}}

                            </div>
                            <div class="col-md-7">
                                <div class="product-details offset-md-1">
                                    <h2 class="lead" style="margin-top:1em">{{ $product->name }}</h2>
                                    <span class="badge badge-success" style="font-size: 1em">{{ $stockLevel }}</span>
                                    <p class="light-text">{{ $product->details }}</p>
                                    <h3 class="lead">$ {{ format($product->price) }}</h3>
                                    <p class="light-text">{!! $product->description !!}</p>
                                    @if ($product->quantity > 0)
                                        <form action="{{ route('cart.store') }}" method="POST">
                                            @csrf()
                                            <input type="hidden" name="id" value="{{ $product->id }}">
                                            <input type="hidden" name="name" value="{{ $product->name }}">
                                            <input type="hidden" name="price" value="{{ $product->price }}">
                                            <button type="submit" class="btn btn-success">Add to Cart</button>
                                        </form>
                                    @endif
                                </div>
                            </div>
                        </div>
                        {{-- <div class="pos-relative js-post-content">
                            <div class="comment-form">
                                <h4>Leave a Reply</h4>
                                <form class="form-contact comment_form" action="" method="post" id="commentForm">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea class="form-control w-100" maxlength="1000" formControlName="comment" name="comment" id="comment"
                                                    cols="30" rows="9" placeholder="Write Comment"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input class="form-control" formControlName="name" name="name"
                                                    id="name" type="text" placeholder="Name">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input class="form-control" formControlName="email" name="email"
                                                    id="email" type="email" placeholder="Email (will be hidden)">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Post
                                            Reply</button>
                                    </div>

                                </form>
                            </div>
                        </div> --}}
                    </div>
                </div>




            </div>
        </article>

    </main>
@endsection
