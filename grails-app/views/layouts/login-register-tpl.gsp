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

    <link rel="stylesheet" href="${resource(dir: 'font-awesome/css/', file: 'font-awesome.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'jquery.steps.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'style.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'style-responsive.css')}" type="text/css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    %{--<r:require modules="jquery"/>--}%
    <g:layoutHead/>
    <r:layoutResources/>
    <style>

    .login-wrap{
        border-bottom: 1px solid #a0b87e;
        border-left: 1px solid #a0b87e;
        border-right: 1px solid #a0b87e;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }
    .body-background {
        overflow:hidden;
        background-color: #2e2e2e !important;
        background:url('${resource(dir: "images", file: "theme.png")}');
    }
    .form-horizontal .control-label {
        text-align:left;
        font-weight:bold;
    }
    </style>
</head>

<body class="login-body body-background">
    <g:layoutBody/>
<!--Core js-->
<script src="${resource(dir: 'js/', file: 'jquery.js')}"></script>
<!--Bootstrap js-->
<script src="${resource(dir: 'bs3/js', file: 'bootstrap.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.steps.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
<g:javascript library="application"/>
<r:layoutResources/>

</body>
</html>
