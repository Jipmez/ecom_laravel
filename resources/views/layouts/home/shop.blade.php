@extends('layouts.app')
@section('title', $products->name)
@section('content')
    <main class="main-wrap">
        <article>
            <div class="l-content in-post">
                <div class="l-wrapper in-post  js-aos-wrapper" data-aos="fade-up" data-aos-delay="300">
                    <div class="l-post-content js-progress-content">
                        <header class="m-heading">
                            <h1 class="m-heading__title in-post"><%= locals.content.description %></h1>
                            <div class="m-heading__meta">
                                <a href="../tag/bitcoin/index.html"
                                    class="m-heading__meta__tag"><%= locals.content.tags %></a>
                                <span class="m-heading__meta__divider" aria-hidden="true">&bull;</span>
                                <span
                                    class="m-heading__meta__time"><%= locals.content.createdAt.toLocaleDateString() %></span>
                            </div>
                        </header>
                        <div class="pos-relative js-post-content">
                            <div class="m-share">
                                <div class="m-share__content js-sticky">
                                    <a href="#" class="m-icon-button filled in-share" target="_blank" rel="noopener"
                                        aria-label="Facebook">
                                        <span class="icon-facebook" aria-hidden="true"></span>
                                    </a>
                                    <a href="#" class="m-icon-button filled in-share" target="_blank" rel="noopener"
                                        aria-label="Twitter">
                                        <span class="icon-twitter" aria-hidden="true"></span>
                                    </a>
                                    <button class="m-icon-button filled in-share progress js-scrolltop"
                                        aria-label="Scroll to top">
                                        <span class="icon-arrow-top" aria-hidden="true"></span>
                                        <svg aria-hidden="true">
                                            <circle class="progress-ring__circle js-progress" fill="transparent"
                                                r="0" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <figure class="kg-card kg-image-card"><img src="/uploads/<%- locals.content.image %>"
                                    class="kg-image js-zoomable medium-zoom-image" alt="" loading="lazy"
                                    width="100%" height="100%" srcset="/uploads/<%- locals.content.image %>"
                                    sizes="(min-width: 720px) 720px"></figure>
                            <%- locals.content.content %>



                            <div class="comments-area">
                                <h4>Comments</h4>
                                <div class="comment-list">
                                    <% content.comments.forEach(article => { %>
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="https://secure.gravatar.com/avatar/79ddfdb1e1d87df5f5e3c02f20ecc4ca?s=70&d=mm&r=g"
                                                    alt="">
                                            </div>
                                            <div class="desc">
                                                <p class="comment">
                                                    <%- article.comment %>
                                                </p>
                                                <div class="d-flex justify-content-between">
                                                    <div class="align-items-center">
                                                        <h5>
                                                            <%- article.name %>
                                                        </h5>
                                                        <p class="date">
                                                            <%= article.createdAt.toLocaleDateString() %></p>
                                                        <!-- Date format December 4, 2020 at 3:12 pm -->
                                                    </div>

                                                    <% if(locals.edit === true) {  %>
                                                    <a href="/user/deletecomment/<%- article.id %>"
                                                        class="m-icon-button filled in-share text-danger ml-5"
                                                        rel="noopener" aria-label="Delete">
                                                        <span class="icon-close" aria-hidden="true"></span>
                                                    </a>
                                                    <%} %>
                                                    <div class="reply-btn">
                                                        <!-- <a href="#" class="btn-reply text-uppercase">reply</a> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% }) %>
                                </div>
                            </div>

                            <div class="comment-form">
                                <h4>Leave a Reply</h4>


                                <% if(locals.failed != null) { %>
                                <h4 class="text-danger"> *<%= locals.failed %></h4>
                                <% } %>
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

                            <style>
                                .d-flex {
                                    display: flex;
                                }

                                .comments-area {
                                    background: transparent;
                                    border-top: 1px solid #eee;
                                    padding: 45px 0;
                                    margin-top: 50px;
                                }

                                @media (max-width: 414px) {
                                    .comments-area {
                                        padding: 18px 8px;
                                    }
                                }

                                .comments-area h4 {
                                    margin-bottom: 35px;
                                    color: #2a2a2a;
                                    font-size: 18px;
                                }

                                .comments-area h5 {
                                    font-size: 16px;
                                    margin-bottom: 0px;
                                }

                                .comments-area a {
                                    color: #2a2a2a;
                                }

                                .comments-area .comment-list {
                                    padding-bottom: 48px;
                                }

                                .comments-area .comment-list:last-child {
                                    padding-bottom: 0px;
                                }

                                .comments-area .comment-list.left-padding {
                                    padding-left: 25px;
                                }

                                @media (max-width: 413px) {
                                    .comments-area .comment-list .single-comment h5 {
                                        font-size: 12px;
                                    }

                                    .comments-area .comment-list .single-comment .date {
                                        font-size: 11px;
                                    }

                                    .comments-area .comment-list .single-comment .comment {
                                        font-size: 10px;
                                    }
                                }

                                .comments-area .thumb {
                                    margin-right: 20px;
                                }

                                .comments-area .thumb img {
                                    width: 65px;
                                    border-radius: 50%;
                                }

                                .comments-area .date {
                                    font-size: 14px;
                                    color: #999999;
                                    margin-bottom: 0;
                                    /*  margin-left: 20px; */
                                }

                                .comments-area .comment {
                                    margin-bottom: 0px;
                                    color: #777777;
                                    font-size: 15px;
                                }

                                .comments-area .btn-reply {
                                    background-color: transparent;
                                    color: #888888;
                                    padding: 5px 18px;
                                    font-size: 14px;
                                    display: block;
                                    font-weight: 400;
                                }

                                .comment-form {
                                    border-top: 1px solid #eee;
                                    padding-top: 45px;
                                    /*  margin-top: 50px; */
                                    margin-bottom: 20px;
                                }

                                .comment-form .form-group {
                                    margin-bottom: 30px;
                                }

                                .comment-form h4 {
                                    margin-bottom: 40px;
                                    font-size: 18px;
                                    line-height: 22px;
                                    color: #2a2a2a;
                                }

                                .comment-form .name {
                                    padding-left: 0px;
                                }

                                @media (max-width: 767px) {
                                    .comment-form .name {
                                        padding-right: 0px;
                                        margin-bottom: 1rem;
                                    }
                                }

                                .comment-form .email {
                                    padding-right: 0px;
                                }

                                @media (max-width: 991px) {
                                    .comment-form .email {
                                        padding-left: 0px;
                                    }
                                }

                                .comment-form .form-control {
                                    border: 1px solid #f0e9ff;
                                    border-radius: 5px;
                                    height: 48px;
                                    padding-left: 18px;
                                    font-size: 13px;
                                    background: transparent;
                                }

                                .comment-form .form-control:focus {
                                    outline: 0;
                                    box-shadow: none;
                                }

                                .comment-form .form-control::placeholder {
                                    font-weight: 300;
                                    color: #999999;
                                }

                                .comment-form .form-control::placeholder {
                                    color: #777777;
                                }

                                .comment-form textarea {
                                    padding-top: 18px;
                                    border-radius: 12px;
                                    height: 100% !important;
                                }

                                .comment-form ::-webkit-input-placeholder {
                                    /* Chrome/Opera/Safari */
                                    font-size: 13px;
                                    color: #777;
                                }

                                .comment-form ::-moz-placeholder {
                                    /* Firefox 19+ */
                                    font-size: 13px;
                                    color: #777;
                                }

                                .comment-form :-ms-input-placeholder {
                                    /* IE 10+ */
                                    font-size: 13px;
                                    color: #777;
                                }

                                .comment-form :-moz-placeholder {
                                    /* Firefox 18- */
                                    font-size: 13px;
                                    color: #777;
                                }
                            </style>
                            <section class="m-tags in-post">
                                <h3 class="m-submenu-title">Tags</h3>
                                <ul>
                                    @foreach ($tags as $tag)
                                        <li>
                                            <a href="{{ $tag->slug }}" title="<%= tag.tag %>">{{ $tag->name }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </section>
                        </div>
                    </div>
                </div>




            </div>
        </article>

    </main>
@endsection
