<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login - Edupal.co</title>
    <meta name="layout" content="login-register-tpl"/>
    <!--Core CSS -->
    %{--<link rel="stylesheet" href="${resource(dir: 'bs3/css', file: 'bootstrap.min.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-reset.css')}" type="text/css">--}%
    %{--<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />--}%

    <!-- Custom styles for this template -->
    %{--<link rel="stylesheet" href="${resource(dir: 'css/', file: 'style.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'css/', file: 'style-responsive.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'font-awesome/css', file: 'font-awesome.min.css')}" type="text/css">--}%

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->


</head>

<body class="login-body body-background">

<div class="container">
    <img src="${resource(dir: 'images', file: 'edupal_.png')}" style="position:absolute; left:50%; width: 200px; margin-left:-100px; margin-top:50px;"/>
    <form action='${postUrl}' method='POST' id='loginForm' class='form-signin cssform' autocomplete='off' style="margin-top:150px;">

            <h2 class="form-signin-heading">sign in now</h2>

            <h5 style="color:blue;"> ${flash.message}</h5>

            <div class="login-wrap">
            <div class="user-login-info">
                <input type="text" name="j_username" id="username" class="form-control" placeholder="User ID" required autofocus>
                <input type="password" name="j_password" id="password" class="form-control" placeholder="Password" required>
            </div>
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> Forgot Password?</a>

                </span>
            </label>
            <button  id="submit"  class="btn btn-lg btn-login btn-block submit" type="submit">Sign in</button>

            <div class="registration">
                Don't have an account yet?
                <a class="" href="${g.createLink(controller: 'register')}">
                    Create an account
                </a>
            </div>

        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Enter your e-mail address below to reset your password.</p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                        <button class="btn btn-success" type="button">Submit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
%{--<script src="${resource(dir: 'js/', file: 'jquery.js')}"></script>--}%
%{--<script src="${resource(dir: 'bs3/js', file: 'bootstrap.min.js')}"></script>--}%

</body>
</html>