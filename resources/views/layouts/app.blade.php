<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }} | @yield('title')</title>



    <!-- Styles -->
    <link href="{{ asset('public/backend/plugins/datatable/datatables.min.css') }}" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="preload" href="{{ asset('css/appfabb.css') }}" as="style" />
    <link rel="preload" href="{{ asset('js/manifestfabb.js') }}" as="script" />
    <link rel="preload" href="{{ asset('js/vendor/content-api.minfabb.js') }}" as="script" />
    <link rel="preload" href="{{ asset('js/vendorfabb.js') }}" as="script" />
    <link rel="preload" href="{{ asset('js/appfabb.js') }}" as="script" />

    <link rel="preload" href="{{ asset('css/homefabb.css') }}" as="style" />
    <link rel="preload" href="{{ asset('css/listingfabb.css') }}" as="style" />
    <link rel="preload" href="{{ asset('public/js/homefabb.js') }}" as="script" />


    <style>
        /* These font-faces are here to make fonts work if the Ghost instance is installed in a subdirectory */

        /* source-sans-pro-regular */
        @font-face {
            font-family: 'Source Sans Pro';
            font-style: normal;
            font-weight: 400;
            font-display: swap;
            src: local('SourceSansPro-Regular'),
                url("/fonts/source-sans-pro/latin/source-sans-pro-regularfabb.woff2?v=b14db496bb") format('woff2'),
                url("/fonts/source-sans-pro/latin/source-sans-pro-regularfabb.woff?v=b14db496bb") format('woff');
        }

        /* source-sans-pro-600 */
        @font-face {
            font-family: 'Source Sans Pro';
            font-style: normal;
            font-weight: 600;
            font-display: swap;
            src: local('SourceSansPro-SemiBold'),
                url("/fonts/source-sans-pro/latin/source-sans-pro-600fabb.woff2?v=b14db496bb") format('woff2'),
                url("/fonts/source-sans-pro/latin/source-sans-pro-600fabb.woff?v=b14db496bb") format('woff');
        }

        /* source-sans-pro-700 */
        @font-face {
            font-family: 'Source Sans Pro';
            font-style: normal;
            font-weight: 700;
            font-display: swap;
            src: local('SourceSansPro-Bold'),
                url("/fonts/source-sans-pro/latin/source-sans-pro-700fabb.woff2?v=b14db496bb") format('woff2'),
                url("/fonts/source-sans-pro/latin/source-sans-pro-700fabb.woff?v=b14db496bb") format('woff');
        }

        /* iconmoon */
        @font-face {
            font-family: 'icomoon';
            font-weight: normal;
            font-style: normal;
            font-display: swap;
            src: url("/fonts/icomoon/icomoonf0fa.eot?101fc3?v=b14db496bb");
            src: url("/fonts/icomoon/icomoon2c17.eot?101fc3#iefix?v=b14db496bb") format('embedded-opentype'),
                url("/fonts/icomoon/icomoonf0fa.ttf?101fc3?v=b14db496bb") format('truetype'),
                url("/fonts/icomoon/icomoonf0fa.woff?101fc3?v=b14db496bb") format('woff'),
                url("/fonts/icomoon/icomoon2c17.svg?101fc3#icomoon?v=b14db496bb") format('svg');
        }
    </style>

    <style>
        a {
            text-decoration: none !important;
        }



        .alert {
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -ms-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            -webkit-box-shadow: 0px 3px 11px -8px rgba(0, 0, 0, 0.54);
            -moz-box-shadow: 0px 3px 11px -8px rgba(0, 0, 0, 0.54);
            box-shadow: 0px 3px 11px -8px rgba(0, 0, 0, 0.54);
            border: none;
            width: 250px;
            height: 70px;
            float: right;
            top: 30px;
            right: 12px;
            position: fixed;
            z-index: 99;
        }

        .alert h2 {
            font-size: 14px;
            position: relative;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        .btn-close {
            position: relative;
            top: 0%;
            right: -90%;
            -webkit-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
            -webkit-transition: all 0.1s ease-in-out;
            -moz-transition: all 0.1s ease-in-out;
            -ms-transition: all 0.1s ease-in-out;
            -o-transition: all 0.1s ease-in-out;
            transition: all 0.1s ease-in-out;
        }

        .btn-close:hover {
            font-size: 10px;
        }

        .esconder {
            right: -300px;
            opacity: 0;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="{{ asset('css/appfabb.css') }}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/homefabb.css') }}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/listingfabb.css') }}" media="screen" />
</head>

<body class="home-template">
    <header class="m-header with-picture js-header">
        <div class="m-mobile-topbar" data-aos="fade-down">
            <button class="m-icon-button in-mobile-topbar js-open-menu" aria-label="Open menu">
                <span class="icon-menu" aria-hidden="true"></span>
            </button>
            <a href="" class="m-logo in-mobile-topbar">
                <h6 class="m-article-card__title js-article-card-title " title="DREAM-PLUG">
                    DREAM-PLUG
                </h6>

            </a>
            <button class="m-icon-button in-mobile-topbar js-open-search" aria-label="Open search">
                <span class="icon-search" aria-hidden="true"></span>
            </button>
        </div>
        <div class="m-menu js-menu">
            <button class="m-icon-button outlined as-close-menu js-close-menu" aria-label="Close menu">
                <span class="icon-close"></span>
            </button>
            <div class="m-menu__main" data-aos="fade-down">
                <div class="l-wrapper">
                    <div class="m-nav js-main-nav">
                        <nav class="m-nav__left js-main-nav-left" role="navigation" aria-label="Main menu">
                            <ul>
                                <li class="only-desktop">
                                    <a href="/" class="m-logo">
                                        <h6 class="m-article-card__title js-article-card-title " title="DREAM-PLUG">
                                            DREAM-PLUG
                                        </h6>
                                    </a>
                                </li>
                                <li class="nav-home nav-current">
                                    <a href="/">Home</a>
                                </li>
                                <li class="more">
                                    <span>
                                        <a href="javascript:void(0);" class="js-open-secondary-menu">
                                            More
                                            <span class="icon-chevron-down" aria-hidden="true"></span>
                                        </a>
                                    </span>
                                </li>
                                <li class="submenu-option js-submenu-option">
                                    <button class="m-icon-button in-menu-main more js-toggle-submenu"
                                        aria-label="Open submenu">
                                        <span class="icon-more" aria-hidden="true"></span>
                                    </button>
                                    <div class="m-submenu js-submenu">
                                        <div class="l-wrapper in-submenu">

                                            <section class="m-tags">
                                                <h3 class="m-submenu-title">Tags</h3>
                                                {{-- <ul>
                                                    <% locals.tags.forEach(tag => { %>
                                                    <li>
                                                        <a href="tag/<%= tag.tag %>"><%= tag.tag %></a>
                                                    </li>
                                                    <% }) %>
                                                </ul> --}}
                                            </section>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <div class="m-nav__right">
                            <button class="m-icon-button in-menu-main js-open-search" aria-label="Open search">
                                <span class="icon-search" aria-hidden="true"></span>
                            </button>
                            <div class="m-toggle-darkmode js-tooltip" data-tippy-content="Toggle dark mode"
                                tabindex="0">
                                <label for="toggle-darkmode" class="sr-only">
                                    Toggle dark mode
                                </label>
                                <input id="toggle-darkmode" type="checkbox" class="js-toggle-darkmode">
                                <div>
                                    <span class="icon-moon moon" aria-hidden="true"></span>
                                    <span class="icon-sunny sun" aria-hidden="true"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="secondary-navigation-template" style="display: none;">
            <ul class="m-secondary-menu">
                <li class="nav-twitter">
                    <a href="https://www.twitter.com/dreamplug">Twitter</a>
                </li>
                <li class="nav-facebook">
                    <a href="https://www.facebook.com/dreamplug">Facebook</a>
                </li>
                <li class="nav-instagram">
                    <a href="https://www.instagram.com/dreamplug">Instagram</a>
                </li>

            </ul>
        </div>
    </header>

    <div>
        @yield('content')
        @include('partials.toast')
    </div>

    <div>
        @include('layouts.footer')
    </div>

    <script defer src="{{ asset('js/manifestfabb.js') }}"></script>
    <script defer src="{{ asset('js/vendor/content-api.minfabb.js') }}"></script>
    <script defer src="{{ asset('js/vendorfabb.js') }}"></script>
    <script defer src="{{ asset('js/appfabb.js') }}"></script>
    <script defer src="{{ asset('js/homefabb.js') }}"></script>


    @yield('scripts')
</body>

</html>
