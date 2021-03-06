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
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'multi-select.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'css/', file: 'bootstrap-duallistbox.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css/', file: 'jquery.multiselect.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css/', file: 'jquery.multiselect.filter.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'bootstrap-fullcalendar.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'datepicker.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'DT_bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'font-awesome/css/', file: 'font-awesome.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: '/css/', file: 'select2.css')}" type="text/css">
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

    <a href="${g.createLink(controller: 'home',action: 'index')}" class="logo">
        <img src="${resource(dir: 'images/theme', file: 'aab.png')}" alt="Baily School" width="100px">
    </a>

    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->
    <g:render template="/header-with-menu"/>

</header>
<!--header end-->
<!--sidebar start-->
<aside>
        <!-- sidebar menu start-->
        <g:render template="/settings-left-menu"/>
        <!-- sidebar menu end-->
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
%{--<script src="${resource(dir: 'js/', file: 'jquery.js')}"></script>--}%
<script src="${resource(dir: 'js/', file: 'jquery-ui-1.9.2.custom.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'fullcalendar.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'external-dragging-calendar.js')}"></script>
<script src="${resource(dir: 'bs3/js', file: 'bootstrap.min.js')}"></script>
<script src="${resource(dir: 'js/multi-select', file: 'jquery.multi-select.js')}"></script>
%{--<script src="${resource(dir: 'js', file: 'jquery.bootstrap-duallistbox.js')}"></script>--}%
%{--<script src="${resource(dir: 'js', file: 'jquery.multiselect.min.js')}"></script>--}%
<script src="${resource(dir: 'js/date-time', file: 'bootstrap-datepicker.min.js')}"></script>
%{--<script src="${resource(dir: 'js/', file: 'jquery.dcjqaccordion.2.7.js')}"></script>--}%
<script src="${resource(dir: 'js/vertical-menu', file: 'jquery.cookie.js')}"></script>
%{--<script src="${resource(dir: 'js/vertical-menu', file: 'jquery.hoverIntent.minified.js')}"></script>--}%
<script src="${resource(dir: 'js/vertical-menu', file: 'jquery.dcjqaccordion.2.7.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.scrollTo.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.nicescroll.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.nicescroll.js')}"></script>
<script src="${resource(dir: 'js/', file: 'draggable-portlet.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.dataTables.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'dataTables.bootstrap.js')}"></script>
<script src="${resource(dir: 'js/', file: 'jquery.validate.min.js')}"></script>
<script src="${resource(dir: 'js/', file: 'bootstrap-growl.min.js')}"></script>
<script src="${resource(dir: '/js/', file: 'select2.js')}"></script>
<script src="${resource(dir: '/js/', file: 'select-init.js')}"></script>
<script src="${resource(dir: 'js/', file: 'scripts.js')}"></script>

<g:javascript library="application"/>
<r:layoutResources/>

</body>
</html>
