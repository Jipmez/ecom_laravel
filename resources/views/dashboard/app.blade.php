<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>{{ config('app.name', 'Laravel') }} | @yield('title')</title>



    <!-- General CSS Files -->
    <link rel="stylesheet" href="{{ asset('gati/css/app.min.css') }}">
    <link rel="stylesheet" href="{{ asset('gati/bundles/jquery-selectric/selectric.css') }}">
    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('gati/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('gati/css/components.css') }}">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="{{ asset('gati/css/custom.css') }}">
    @yield('ck')

    <style>
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
            z-index: 999;
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
</head>

<body>

    <div class="loader"></div>
    <div id="app">
        <div class="main-wrapper main-wrapper-1">
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar sticky">
                <div class="form-inline me-auto">
                    <ul class="navbar-nav mr-3">
                        <li><a href="#" data-bs-toggle="sidebar"
                                class="nav-link nav-link-lg
									collapse-btn"> <i data-feather="menu"></i></a></li>
                    </ul>
                </div>

            </nav>
            <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                    <!--   <div class="sidebar-brand">
                        <a href="index-2.html"> <img alt="image" src="/gati/img/logo.png" class="header-logo" /> <span
                                class="logo-name">Gati</span>
                        </a>
                    </div> -->
                    <div class="sidebar-user">
                        <!--    <div class="sidebar-user-picture">
                            <img alt="image" src="/gati/img/user.png">
                        </div> -->
                        <div class="sidebar-user-details">
                            <div class="user-name">User</div>
                            <div class="user-role">Administrator</div>

                        </div>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="dropdown">
                            <a href="{{ route('home') }}" class="nav-link"><i
                                    data-feather="calendar"></i><span>Dashboard</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="{{ route('create.index') }}" class="nav-link"><i
                                    data-feather="check-circle"></i><span>Create
                                    Post</span></a>
                        </li>
                        <li class="#">
                            <form action="{{ route('logout') }}" method="POST" id="GFG">
                                @csrf
                            </form>
                            <a href="javascript:void(0);" onclick="document.getElementById('GFG').submit();"
                                class="nav-link"><i data-feather="users"></i><span>logout</span></a>
                        </li>
                    </ul>
                </aside>
            </div>
            <!-- Main Content -->
            <div class="main-content">
                @yield('content')

                <div class="settingSidebar">
                    <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                    </a>
                    <div class="settingSidebar-body ps-container ps-theme-default">
                        <div class=" fade show active">
                            <div class="setting-panel-header">Setting Panel
                            </div>
                            <div class="p-15 border-bottom">
                                <h6 class="font-medium m-b-10">Select Layout</h6>
                                <div class="selectgroup layout-color w-50">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="value" value="1"
                                            class="selectgroup-input-radio select-layout" checked>
                                        <span class="selectgroup-button">Light</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="value" value="2"
                                            class="selectgroup-input-radio select-layout">
                                        <span class="selectgroup-button">Dark</span>
                                    </label>
                                </div>
                            </div>
                            <div class="p-15 border-bottom">
                                <h6 class="font-medium m-b-10">Sidebar Color</h6>
                                <div class="selectgroup selectgroup-pills sidebar-color">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="icon-input" value="1"
                                            class="selectgroup-input select-sidebar">
                                        <span class="selectgroup-button selectgroup-button-icon"
                                            data-bs-toggle="tooltip" data-original-title="Light Sidebar"><i
                                                class="fas fa-sun"></i></span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="icon-input" value="2"
                                            class="selectgroup-input select-sidebar" checked>
                                        <span class="selectgroup-button selectgroup-button-icon"
                                            data-bs-toggle="tooltip" data-original-title="Dark Sidebar"><i
                                                class="fas fa-moon"></i></span>
                                    </label>
                                </div>
                            </div>
                            <div class="p-15 border-bottom">
                                <h6 class="font-medium m-b-10">Color Theme</h6>
                                <div class="theme-setting-options">
                                    <ul class="choose-theme list-unstyled mb-0">
                                        <li title="white" class="active">
                                            <div class="white"></div>
                                        </li>
                                        <li title="cyan">
                                            <div class="cyan"></div>
                                        </li>
                                        <li title="black">
                                            <div class="black"></div>
                                        </li>
                                        <li title="purple">
                                            <div class="purple"></div>
                                        </li>
                                        <li title="orange">
                                            <div class="orange"></div>
                                        </li>
                                        <li title="green">
                                            <div class="green"></div>
                                        </li>
                                        <li title="red">
                                            <div class="red"></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="p-15 border-bottom">
                                <div class="theme-setting-options">
                                    <label class="m-b-0">
                                        <input type="checkbox" name="custom-switch-checkbox"
                                            class="custom-switch-input" id="mini_sidebar_setting">
                                        <span class="custom-switch-indicator"></span>
                                        <span class="control-label p-l-10">Mini Sidebar</span>
                                    </label>
                                </div>
                            </div>
                            <div class="p-15 border-bottom">
                                <div class="theme-setting-options">
                                    <label class="m-b-0">
                                        <input type="checkbox" name="custom-switch-checkbox"
                                            class="custom-switch-input" id="sticky_header_setting">
                                        <span class="custom-switch-indicator"></span>
                                        <span class="control-label p-l-10">Sticky Header</span>
                                    </label>
                                </div>
                            </div>
                            <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                                <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                                    <i class="fas fa-undo"></i> Restore Default
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('partials.toast')
        </div>
    </div>



    <!-- General JS Scripts -->
    <script src="{{ asset('gati/js/app.min.js') }}"></script>
    <!-- JS Libraies -->
    <script src="{{ asset('gati/bundles/jquery-selectric/jquery.selectric.min.js') }}"></script>
    <!-- Page Specific JS File -->
    <script src="{{ asset('gati/js/page/posts.js') }}"></script>
    <!-- Template JS File -->
    <script src="{{ asset('gati/js/scripts.js') }}"></script>
    <!-- Custom JS File -->
    <script src="{{ asset('gati/js/custom.js') }}"></script>
    @yield('scripts')
</body>

</html>
