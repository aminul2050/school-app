<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
    <meta name="description" content="If you're using Microsoft Excel to calculate your grades then this app is for you.
		Easily create grade sheets for all of your classes and sync your grades from existing networks such as Blackboard and Webassign.
		Your calculated GPA is just a few touches away! Student tools within the app will provide analytical feedback of your performance,
		find study groups, and get help completing assignments.">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'application.css')}" type="text/css">
    %{--k rel="stylesheet" href="${resource(dir: 'css', file: 'style_old2.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'edupal_style.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%
        <r:require modules="jquery"/>
		<g:layoutHead/>
		<r:layoutResources />

	</head>
	<body>
    <!--
        <div id="header"  style="height:75px; background:url('../images/background-gray.png'); text-align:center; width:100%; "> <a href="../"><img height="65px" style="" src="${resource(dir: 'images', file: 'edupal_.png')}"> </a></div>
        -->
        <div id="wrapper">
		<g:layoutBody/>
        </div>


		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
