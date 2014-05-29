<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="EduPal - Academic Tracker"/></title>
    <meta name="description" content="If you're using Microsoft Excel to calculate your grades then this app is for you.
		Easily create grade sheets for all of your classes and sync your grades from existing networks such as Blackboard and Webassign.
		Your calculated GPA is just a few touches away! Student tools within the app will provide analytical feedback of your performance,
		find study groups, and get help completing assignments.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <!--Bootstrap CSS -->
    <link rel="stylesheet" href="${resource(dir: 'bs3/css', file: 'bootstrap.min.css')}" type="text/css">
    <!--Core CSS -->
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'bootstrap-reset.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'bootstrap-fullcalendar.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'font-awesome/css/', file: 'font-awesome.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'DT_bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'style.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'style-responsive.css')}" type="text/css">

    <r:require modules="jquery"/>
    %{--<script src="${resource(dir: 'js/', file: 'nicEdit.js')}"></script>--}%
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

    <a href="${g.createLink(controller: 'home', action: 'index')}" class="logo">
        <img src="${resource(dir: 'images', file: 'edupal.png')}" alt="Edupal" width="100px">
    </a>

    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

<div class="nav notify-row" id="top_menu">
    <!--  notification start -->
    <ul class="nav top-menu">
        <!-- settings start -->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-tasks"></i>
                <span class="badge bg-success">8</span>
            </a>
            <ul class="dropdown-menu extended tasks-bar">
                <li>
                    <p class="">You have 8 pending tasks</p>
                </li>
                <li>
                    <a href="#">
                        <div class="task-info clearfix">
                            <div class="desc pull-left">
                                <h5>Target Sell</h5>

                                <p>25% , Deadline  12 June’13</p>
                            </div>
                            <span class="notification-pie-chart pull-right" data-percent="45">
                                <span class="percent"></span>
                            </span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="task-info clearfix">
                            <div class="desc pull-left">
                                <h5>Product Delivery</h5>

                                <p>45% , Deadline  12 June’13</p>
                            </div>
                            <span class="notification-pie-chart pull-right" data-percent="78">
                                <span class="percent"></span>
                            </span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="task-info clearfix">
                            <div class="desc pull-left">
                                <h5>Payment collection</h5>

                                <p>87% , Deadline  12 June’13</p>
                            </div>
                            <span class="notification-pie-chart pull-right" data-percent="60">
                                <span class="percent"></span>
                            </span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="task-info clearfix">
                            <div class="desc pull-left">
                                <h5>Target Sell</h5>

                                <p>33% , Deadline  12 June’13</p>
                            </div>
                            <span class="notification-pie-chart pull-right" data-percent="90">
                                <span class="percent"></span>
                            </span>
                        </div>
                    </a>
                </li>

                <li class="external">
                    <a href="#">See All Tasks</a>
                </li>
            </ul>
        </li>
        <!-- settings end -->
        <!-- inbox dropdown start-->
        <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-envelope-o"></i>
                <span class="badge bg-important">4</span>
            </a>
            <ul class="dropdown-menu extended inbox">
                <li>
                    <p class="red">You have 4 Mails</p>
                </li>
                <li>
                    <a href="#">
                        <span class="photo">
                            %{--<img alt="avatar" src="images/avatar-mini.jpg">--}%
                        </span>
                        <span class="subject">
                            <span class="from">Jonathan Smith</span>
                            <span class="time">Just now</span>
                        </span>
                        <span class="message">
                            Hello, this is an example msg.
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="photo">
                            %{--<img alt="avatar" src="images/avatar-mini-2.jpg">--}%
                        </span>
                        <span class="subject">
                            <span class="from">Jane Doe</span>
                            <span class="time">2 min ago</span>
                        </span>
                        <span class="message">
                            Nice admin template
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="photo">
                            %{--<img alt="avatar" src="images/avatar-mini-3.jpg">--}%
                        </span>
                        <span class="subject">
                            <span class="from">Tasi sam</span>
                            <span class="time">2 days ago</span>
                        </span>
                        <span class="message">
                            This is an example msg.
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="photo">
                            %{--<img alt="avatar" src="images/avatar-mini.jpg">--}%
                        </span>
                        <span class="subject">
                            <span class="from">Mr. Perfect</span>
                            <span class="time">2 hour ago</span>
                        </span>
                        <span class="message">
                            Hi there, its a test
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">See all messages</a>
                </li>
            </ul>
        </li>
        <!-- inbox dropdown end -->
        <!-- notification dropdown start-->
        <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                <i class="fa fa-bell-o"></i>
                <span class="badge bg-warning">3</span>
            </a>
            <ul class="dropdown-menu extended notification">
                <li>
                    <p>Notifications</p>
                </li>
                <li>
                    <div class="alert alert-info clearfix">
                        <span class="alert-icon"><i class="fa fa-bolt"></i></span>

                        <div class="noti-info">
                            <a href="#">Server #1 overloaded.</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="alert alert-danger clearfix">
                        <span class="alert-icon"><i class="fa fa-bolt"></i></span>

                        <div class="noti-info">
                            <a href="#">Server #2 overloaded.</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="alert alert-success clearfix">
                        <span class="alert-icon"><i class="fa fa-bolt"></i></span>

                        <div class="noti-info">
                            <a href="#">Server #3 overloaded.</a>
                        </div>
                    </div>
                </li>

            </ul>
        </li>
        <!-- notification dropdown end -->
    </ul>
    <!--  notification end -->
</div>

<div class="top-nav clearfix">
    <!--search & user info start-->

    <ul class="nav pull-right top-menu">
        <li>
            <a href="#">Settings</a>
        </li>
        <li>
            <a href="#">Student Mgmt</a>
        </li>
        <li>
            <input type="text" class="form-control search" placeholder=" Search">
        </li>
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="${resource(dir: 'images', file: 'user-avater.jpg')}">
                <span class="username"><sec:loggedInUserInfo field="username"/></span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                <li><a href="${g.createLink(controller: 'logout')}"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->

    </ul>
    <!--search & user info end-->
</div>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <g:render template="/admin-left-menu"/>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <g:layoutBody/>
    </section>
</section>
<!--main content end-->
<!--right sidebar start-->
</section>

<!--Bootstrap js-->
<!--Core js-->
<script src="${resource(dir: 'js/', file: 'jquery.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery-ui-1.9.2.custom.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'fullcalendar.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'external-dragging-calendar.js')}"></script>
<script src="${resource(dir: 'bs3/js', file: 'bootstrap.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.dcjqaccordion.2.7.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.scrollTo.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.nicescroll.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.nicescroll.js')}"></script>
<script src="${resource(dir: 'js/', file: 'draggable-portlet.js')}"></script>
<script src="${resource(dir: 'js/', file: 'scripts.js')}"></script>

<script src="${resource(dir: 'js/', file: 'jquery.dataTables.js')}"></script>
<script src="${resource(dir: 'js/', file: 'dataTables.bootstrap.js')}"></script>

<g:javascript library="application"/>
<r:layoutResources/>

</body>
</html>
