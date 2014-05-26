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
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <style>html #body{background-repeat:no-repeat; background-color:#151515;}.tab_home a{color:#A3C651; font-weight:bold;}</style>
</head>
<body id="body">
    <div class="col-md-12">
        <div id="content" style="max-width:360px; margin:0 0 0 auto; text-align: center;">
                <img src="${resource(dir: 'images', file: 'logo-small.png')}" alt="Grails" style="width:100%; margin-top:20px; text-shadow: 0 1px 3px #000000;"/>
                <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off' style="text-align: center;">
                    <g:if test="${flash.message}">
                        <h4 style="color:#e64b39;"> ${flash.message}</h4>
                    </g:if>
                    <g:else>
                        <h3 style="color:white;">Academic Time Management Tool</h3>
                    </g:else>

                    <div>
                        <input type='text' placeholder="Username" class='text_ btn btn-default btn-block wide' name='j_username' id='username' style="text-align:left; padding-left:10px;"/>
                    </div>
                    <div>
                        <input type="password" name='j_password' id='password' placeholder="Password" class="text_ btn btn-default btn-block wide" style="text-align:left; padding-left:10px;">
                    </div>
                    <div>
                        <input type="submit" value="Login" id="submit btn btn-default" class="submit"> &nbsp; <a href="forgot.gsp" style="font-size:12px;" >Forgot Your Password?</a>
                    </div>
                </form>

            <div id="footer" style="text-align: center;">

                <p>Want to make an account? Students & Parents can track 1 course free with options to upgrade.</p>
                <a href="${createLink(uri: '/')}registration/register" class="autoload btn btn-default btn-block narrow" onclick="highlight(this)">Create An Account</a>
           <br>

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
                <li class="tab_terms"><a href="${createLink(uri: '/')}terms/">Terms & Policy</a></li>
                <li class="tab_contact"><a href="${createLink(uri: '/')}contact/" class="autoload">Contact</a></li>
                <li class="tab_map"><a href="#">Site Map</a></li>
            </ul>
        </div>
    </div>



<script type="text/javascript">
    function newPopup(url) {
        popupWindow = window.open(
                url,'popUpWindow','height=700,width=800,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
    }
</script>

</body>
</html>