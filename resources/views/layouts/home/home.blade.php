@extends('layouts.app')
@section('content')
    <main class="main-wrap">
        <section class="m-hero with-picture" data-aos="fade">
            <div class="m-hero__picture ">
                <img srcset="/images/new-2.jpg" sizes="(max-width: 600px) 600px, (max-width: 1000px) 1000px, 2000px"
                    src="/images/new-2.jpg" alt="" />
            </div>
            <div class="m-hero__content" data-aos="fade-down">
                <h1 class="m-hero-title bigger " style="margin-top: 29px;">Dream Plug</h1>
            </div>
        </section>
        <div class="l-content">
            <div class="l-wrapper" data-aos="fade-up" data-aos-delay="300">
                <div class="l-grid">

                    @foreach ($products as $product)
                        <article class="m-article-card  post tag-blockchain tag-crypto-spotlight-africa tag-obiex-finance">
                            <div class="m-article-card__picture">
                                <a href="{{ route('shop.show', $product->slug) }}" class="m-article-card__picture-link"
                                    aria-hidden="true" tabindex="-1"></a>
                                <img class="m-article-card__picture-background" src="{{ productImage($product->image) }}"
                                    loading="lazy" alt="">
                                <a href="author/nwogbo/index.html" class="m-article-card__author js-tooltip"
                                    aria-label="{{ $product->name }}" data-tippy-content="{{ $product->name }}">
                                    <div style="background-image: url({{ productImage($product->image) }});">
                                    </div>
                                </a>
                            </div>
                            <div class="m-article-card__info">
                                <a href="javascript:void(0);" class="m-article-card__tag">{{ $product->name }}</a>
                                <a href="{{ route('shop.show', $product->slug) }}" class="m-article-card__info-link"
                                    aria-label="{{ $product->name }}">
                                    <div>
                                        <h2 class="m-article-card__title js-article-card-title "
                                            title="{{ $product->name }}">
                                            {{ format($product->price) }}
                                        </h2>
                                    </div>
                                    <div class="m-article-card__timestamp">
                                        <span>
                                            @if ($product->quantity > 0)
                                                <form action="{{ route('cart.store') }}" method="POST">
                                                    @csrf()
                                                    <input type="hidden" name="id" value="{{ $product->id }}">
                                                    <input type="hidden" name="name" value="{{ $product->name }}">
                                                    <input type="hidden" name="price" value="{{ $product->price }}">
                                                    <button type="submit" class="btn btn-success">Add to Cart</button>
                                                </form>
                                            @endif
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </article>
                    @endforeach
                </div>
            </div>

        </div>
    </main>
@endsection
