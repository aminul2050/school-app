<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin-tpl"/>
    <title>Empty page - Edupal.co</title>

</head>
<body>
<!-- page start-->
<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Change Account Info
            </header>
            <div class="panel-body">
                <div class="position-left">
                    <div class="col-lg-6">
                        <label> Full Name</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-lg-6">
                        <label>Email</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-lg-6">
                            <label>Username</label>
                            <input type="text" class="form-control">
                    </div>
                    <div class="col-lg-6">
                            <label>Gender</label>
                            <select class="form-control">
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                    </div>
                    <div class="col-lg-6">
                        <label>Password</label>
                        <input type="password" class="form-control" value="123456">
                    </div>
                    <div class="col-lg-6">
                        <label>Confirm Password</label>
                        <input type="text" class="form-control" placeholder="Confirm Password">
                    </div>
                    <div class="col-lg-6">
                        <input type="submit" class="btn btn-primary" value="Save Changes">
                    </div>

                </div>
            </div>
        </section>
    </div>
</div>
<!-- page end-->

<!-- page start-->
<div class="row">
    <div class="col-lg-12">

        <section class="panel">
            <header class="panel-heading">
                Form Elements
            </header>
            <div class="panel-body">
                <form class="form-horizontal bucket-form" method="get">
                    <div class="form-group">

                    <div class="col-sm-6">
                        <label class="">Default</label>
                        <input type="text" class="form-control">
                    </div>

                     <div class="col-sm-6">
                         <label class="l">Default</label>
                            <input type="text" class="form-control">
                      </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Help text</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control">
                            <span class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Rounder</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control round-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Input focus</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="focusedInput" type="text" value="This is focused...">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Disabled</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Placeholder</label>
                        <div class="col-sm-6">
                            <input type="text"  class="form-control" placeholder="placeholder">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-6">
                            <input type="password"  class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class=" col-sm-3 control-label">Static control</label>
                        <div class="col-lg-6">
                            <p class="form-control-static">email@example.com</p>
                        </div>
                    </div>
                    <div class="form-group has-success">
                        <label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Input with success</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" id="inputSuccess">
                        </div>
                    </div>
                    <div class="form-group has-warning">
                        <label class="col-sm-3 control-label col-lg-3" for="inputWarning">Input with warning</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" id="inputWarning">
                        </div>
                    </div>
                    <div class="form-group has-error">
                        <label class="col-sm-3 control-label col-lg-3" for="inputError">Input with error</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" id="inputError">
                        </div>
                    </div>
                </form>
            </div>
        </section>

    </div>
</div>

<!-- page end-->
</body>
</html>
