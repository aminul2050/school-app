<!DOCTYPE HTML>
<html>
<head>
    <title>EduPal | Home</title>
    <meta name="description" content="If you're using Microsoft Excel to calculate your grades then this app is for you.
		Easily create grade sheets for all of your classes and sync your grades from existing networks such as Blackboard and Webassign. 
		Your calculated GPA is just a few touches away! Student tools within the app will provide analytical feedback of your performance, 
		find study groups, and get help completing assignments.">
    <meta charset="UTF-8" />
    %{--<meta name="layout" content="main">--}%
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- <link rel="shortcut icon" href="/edupal/static/images/favicon.ico" type="image/x-icon"> -->
    <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <style>.tab_home a{color:#A3C651; font-weight:bold;}</style>
</head>
<body id="body">
<div id="content">
    <div>
        <img src="${resource(dir: 'images', file: 'edupal_.png')}" alt="Grails" width="100%" style="text-shadow: 0 1px 3px #000000;"/>
        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <div>
                <input type='text' placeholder="Username" class='text_ btn btn-default btn-block textleft wide' name='j_username' id='username' style="padding-left:10px;"/>
            </div>
            <div>
                <input type="password" name='j_password' id='password' placeholder="Password" class="text_ btn btn-default btn-block textleft wide" style="padding-left:10px;">
            </div>
            <div>
                <input type="submit" value="Login" id="submit" class="submit"> &nbsp; <a href="#" style="font-size:12px;">Forgot Your Password?</a>
            </div>
        </form>
    </div>
    <div id="footer">

        <p>Want to make an account? Students & Parents can track 1 course free with options to upgrade.</p>
        <a href="${createLink(uri: '/')}registration/register" class="autoload btn btn-default btn-block narrow"onclick="highlight(this)">Create An Account</a>
        <br>
        <a href="http://www.facebook.com/myedupal" target="_blank"><img src="../images/facebook.png" width="50px"></a>
        <a href="http://www.twitter.com/myedupal" target="_blank"><img src="../images/twitter.png" width="50px"></a><br>
        <p style="color:silver; font-size:12px;">Copyright &copy 2014 All Rights Reserved. <a href="http://www.globatum.com" target="_blank">Globatum, Inc.</a></p>
    </div>
</div>
<div id="navigation">
    <ul>
        <li class="tab_home"><a href="#">Home</a></li>
        <li class="tab_about"><a href="${createLink(uri: '/')}about/" class="autoload">About</a></li>
        <li class="tab_download"><a href="#">Download</a></li>
        <li class="tab_press"><a href="#">Press</a></li>
        <li class="tab_business"><a href="#">Partners</a></li>
        <li class="tab_terms"><a href="#">Terms & Policy</a></li>
        <li class="tab_contact"><a href="${createLink(uri: '/')}contact/" class="autoload">Contact</a></li>
        <li class="tab_map"><a href="#">Site Map</a></li>
    </ul>
</div>
</body>
</html>