<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/" class="nav-link">Home</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="#" class="nav-link">Contact</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        <li class="nav-item">
            <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                <i class="fas fa-search"></i>
            </a>
            <div class="navbar-search-block">
                <form class="form-inline">
                    <div class="input-group input-group-sm">
                        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-navbar" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                            <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <!-- Messages Dropdown Menu -->
        <sec:ifLoggedIn>
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="fa-solid fa-user-tie"></i>
                    <span class="badge badge-danger navbar-badge"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <sec:ifLoggedIn>
                        <g:link class="logout dropdown-item" controller="logout">
                            <div class="media">
                                <div class="media-body">
                                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                    <p class="font-weight-bold text-red">${message(code: 'Logout')}</p>
                                </div>
                            </div>
                        </g:link>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <g:link class="login dropdown-item" controller="login">
                            <div class="media">
                                <div class="media-body">
                                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                    <p class="font-weight-bold text-blue">${message(code: 'Login')}</p>
                                </div>
                            </div>
                        </g:link>
                    </sec:ifNotLoggedIn>
                </div>
            </li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <li class="nav-item">
                <div class="col">
                    <g:link controller="registration" action="index" class="btn btn-primary btn-block">Register</g:link>
                </div>
            </li>
        </sec:ifNotLoggedIn>

        <!-- Notifications Dropdown Menu -->
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/" class="brand-link">
        <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
            </div>
            <div class="info">
                <a href="#" class="d-block">
                    <sec:ifLoggedIn>
                        <sec:loggedInUserInfo field="fullname"/>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <a class="d-block">No User</a>
                    </sec:ifNotLoggedIn>
                </a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fa-solid fa-server"></i>
                        <p>
                            Table List
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <g:link controller="review" action="index" class="nav-link">
                                <i class="nav-icon fa-solid fa-table-list"></i>
                                <p><g:message code = "Review" args="['']"/></p>
                            </g:link>
                        </li>
                        <li class="nav-item">
                            <g:link controller="user" action="index" class="nav-link">
                                <i class="nav-icon fa-solid fa-table-list"></i>
                                <p><g:message code = "User" args="['']"/></p>
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="revtest" action="index" class="nav-link">
                                <i class="nav-icon fa-solid fa-table-list"></i>
                                <p><g:message code = "nReview" args="['']"/></p>
                            </g:link>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>