<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin-tpl"/>
    <title>Student - Edupal.co</title>
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'DT_bootstrap.css')}" type="text/css">
    <script src="${resource(dir: 'js/', file: 'dataTables.bootstrap.js')}"></script>
    <script src="${resource(dir: 'js/', file: 'DT_bootstrap.js')}"></script>
    <script src="${resource(dir: 'js/', file: 'table-editable.js')}"></script>
</head>

<body>

<!-- page start-->
<!-- page start-->
<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Basic Forms
            </header>

            <div class="panel-body">
                <div class="position-center">
                    <form role="form">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Password">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputFile">File input</label>
                            <input type="file" id="exampleInputFile">

                            <p class="help-block">Example block-level help text here.</p>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Check me out
                            </label>
                        </div>
                        <button type="submit" class="btn btn-info">Submit</button>
                    </form>
                </div>

            </div>
        </section>

    </div>

    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Horizontal Forms
            </header>

            <div class="panel-body">
                <div class="position-center">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Email</label>

                            <div class="col-lg-10">
                                <input type="email" class="form-control" id="inputEmail1" placeholder="Email">

                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Password</label>

                            <div class="col-lg-10">
                                <input type="password" class="form-control" id="inputPassword1" placeholder="Password">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn btn-danger">Sign in</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Inline form
            </header>

            <div class="panel-body">
                <div class="position-center">
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword2"
                                   placeholder="Password">
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                        <button type="submit" class="btn btn-success">Sign in</button>
                    </form>
                </div>
            </div>
        </section>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Modal form
            </header>

            <div class="panel-body">
                <div class="position-center ">
                    <div class="text-center">
                        <a href="#myModal" data-toggle="modal" class="btn btn-success">
                            Form in Modal
                        </a>
                        <a href="#myModal-1" data-toggle="modal" class="btn btn-warning">
                            Form in Modal 2
                        </a>
                        <a href="#myModal-2" data-toggle="modal" class="btn btn-danger">
                            Form in Modal 3
                        </a>
                    </div>

                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal"
                         class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close"
                                            type="button">×</button>
                                    <h4 class="modal-title">Form Tittle</h4>
                                </div>

                                <div class="modal-body">

                                    <form role="form">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" class="form-control" id="exampleInputEmail3"
                                                   placeholder="Enter email">
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword3"
                                                   placeholder="Password">
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <input type="file" id="exampleInputFile3">

                                            <p class="help-block">Example block-level help text here.</p>
                                        </div>

                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Check me out
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1"
                         class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close"
                                            type="button">×</button>
                                    <h4 class="modal-title">Form Tittle</h4>
                                </div>

                                <div class="modal-body">

                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="inputEmail1"
                                                   class="col-lg-2 col-sm-2 control-label">Email</label>

                                            <div class="col-lg-10">
                                                <input type="email" class="form-control" id="inputEmail4"
                                                       placeholder="Email">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputPassword1"
                                                   class="col-lg-2 col-sm-2 control-label">Password</label>

                                            <div class="col-lg-10">
                                                <input type="password" class="form-control" id="inputPassword4"
                                                       placeholder="Password">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-lg-offset-2 col-lg-10">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox"> Remember me
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-lg-offset-2 col-lg-10">
                                                <button type="submit" class="btn btn-default">Sign in</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-2"
                         class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close"
                                            type="button">×</button>
                                    <h4 class="modal-title">Form Tittle</h4>
                                </div>

                                <div class="modal-body">
                                    <form class="form-inline" role="form">
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                            <input type="email" class="form-control sm-input" id="exampleInputEmail5"
                                                   placeholder="Enter email">
                                        </div>

                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                                            <input type="password" class="form-control sm-input"
                                                   id="exampleInputPassword5" placeholder="Password">
                                        </div>

                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-default">Sign in</button>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
</div>

<div class="row">
<div class="col-lg-12">
<section class="panel">
    <header class="panel-heading">
        Form Elements
    </header>

    <div class="panel-body">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label">Default</label>

                <div class="col-sm-6">
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
                    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..."
                           disabled>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Placeholder</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="placeholder">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Password</label>

                <div class="col-sm-6">
                    <input type="password" class="form-control" placeholder="">
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

<section class="panel">
    <div class="panel-body">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Control sizing</label>

                <div class="col-lg-6">
                    <input class="form-control input-lg m-bot15" type="text" placeholder=".input-lg">
                    <input class="form-control m-bot15" type="text" placeholder="Default input">
                    <input class="form-control input-sm m-bot15" type="text" placeholder=".input-sm">

                    <select class="form-control input-lg m-bot15">
                        <option>Option 1</option>
                        <option>Option 2</option>
                        <option>Option 3</option>
                    </select>
                    <select class="form-control m-bot15">
                        <option>Option 1</option>
                        <option>Option 2</option>
                        <option>Option 3</option>
                    </select>
                    <select class="form-control input-sm m-bot15">
                        <option>Option 1</option>
                        <option>Option 2</option>
                        <option>Option 3</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
</section>
<section class="panel">
    <div class="panel-body">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Checkboxes and radios</label>

                <div class="col-lg-6">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            Option one is this and that&mdash;be sure to include why it's great
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            Option one is this and that&mdash;be sure to include why it's great option one
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                            Option one is this and that&mdash;be sure to include why it's great
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                            Option two can be something else and selecting it will deselect option one
                        </label>
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Inline checkboxes</label>

                <div class="col-lg-6">
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
                    </label>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Selects</label>

                <div class="col-lg-6">
                    <select class="form-control m-bot15">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>

                    <select multiple class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Column sizing</label>

                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-2">
                            <input type="text" class="form-control" placeholder=".col-lg-2">
                        </div>

                        <div class="col-lg-3">
                            <input type="text" class="form-control" placeholder=".col-lg-3">
                        </div>

                        <div class="col-lg-4">
                            <input type="text" class="form-control" placeholder=".col-lg-4">
                        </div>
                    </div>

                </div>
            </div>

        </form>
    </div>
</section>

<section class="panel">
    <header class="panel-heading">
        Input groups
    </header>

    <div class="panel-body">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3">Basic examples</label>

                <div class="col-lg-6">
                    <div class="input-group m-bot15">
                        <span class="input-group-addon btn-success">@</span>
                        <input type="text" class="form-control" placeholder="Username">
                    </div>

                    <div class="input-group m-bot15">
                        <input type="text" class="form-control">
                        <span class="input-group-addon btn-warning">.00</span>
                    </div>

                    <div class="input-group m-bot15">
                        <span class="input-group-addon">$</span>
                        <input type="text" class="form-control">
                        <span class="input-group-addon ">.00</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3">Sizing</label>

                <div class="col-lg-6">
                    <div class="input-group input-group-lg m-bot15">
                        <span class="input-group-addon btn-danger">@</span>
                        <input type="text" class="form-control input-lg" placeholder="Username">
                    </div>

                    <div class="input-group m-bot15">
                        <span class="input-group-addon">@</span>
                        <input type="text" class="form-control" placeholder="Username">
                    </div>

                    <div class="input-group input-group-sm m-bot15">
                        <span class="input-group-addon">@</span>
                        <input type="text" class="form-control" placeholder="Username">
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3">Iconic</label>

                <div class="col-lg-6">
                    <div class="input-group m-bot15">
                        <span class="input-group-addon btn-white"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" placeholder="Username">
                    </div>

                    <div class="input-group m-bot15">
                        <span class="input-group-addon btn-white"><i class="fa fa-envelope"></i></span>
                        <input type="text" class="form-control" placeholder="Email">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3">Checkboxe and radio</label>

                <div class="col-lg-6">
                    <div class="input-group m-bot15">
                        <span class="input-group-addon">
                            <input type="checkbox">
                        </span>
                        <input type="text" class="form-control">
                    </div>

                    <div class="input-group m-bot15">
                        <span class="input-group-addon">
                            <input type="radio">
                        </span>
                        <input type="text" class="form-control">
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3">Button addons</label>

                <div class="col-lg-6">
                    <div class="input-group m-bot15">
                        <span class="input-group-btn">
                            <button class="btn btn-danger" type="button">Go!</button>
                        </span>
                        <input type="text" class="form-control">
                    </div>

                    <div class="input-group m-bot15">
                        <input type="text" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button">Go!</button>
                        </span>
                    </div>

                    <div class="input-group m-bot15">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-danger dropdown-toggle"
                                    data-toggle="dropdown">Action <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <input type="text" class="form-control">
                    </div>

                    <div class="input-group m-bot15">
                        <input type="text" class="form-control">

                        <div class="input-group-btn">
                            <button type="button" class="btn btn-danger dropdown-toggle"
                                    data-toggle="dropdown">Action <span class="caret"></span></button>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label col-lg-3">Segmented buttons</label>

                <div class="col-lg-6">
                    <div class="input-group m-bot15">
                        <div class="input-group-btn">
                            <button tabindex="-1" class="btn btn-info" type="button">Action</button>
                            <button tabindex="-1" data-toggle="dropdown" class="btn btn-info dropdown-toggle"
                                    type="button">
                                <span class="caret"></span>
                            </button>
                            <ul role="menu" class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <input type="text" class="form-control">
                    </div>

                    <div class="input-group m-bot15">
                        <input type="text" class="form-control">

                        <div class="input-group-btn">
                            <button tabindex="-1" class="btn btn-info" type="button">Action</button>
                            <button tabindex="-1" data-toggle="dropdown" class="btn btn-info dropdown-toggle"
                                    type="button">
                                <span class="caret"></span>
                            </button>
                            <ul role="menu" class="dropdown-menu pull-right">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</section>

</div>
</div>

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Custom Checkbox & Radio
            </header>

            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <form class="form-horizontal bucket-form" method="get">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Checkboxes</label>

                                <div class="col-sm-9 icheck minimal">
                                    <div class="checkbox single-row">
                                        <input type="checkbox" checked="">
                                        <label>Checkbox 1</label>
                                    </div>

                                    <div class="checkbox single-row">
                                        <input type="checkbox" checked="">
                                        <label>Checkbox 2</label>
                                    </div>

                                    <div class="checkbox single-row">
                                        <input type="checkbox" checked="">
                                        <label>Checkbox 3</label>
                                    </div>

                                    <div class="checkbox single-row">
                                        <label class="disabled"><input type="checkbox" disabled="" checked=""></label>
                                        <label>Disabled</label>
                                    </div>


                                    <div class="checkbox checked single-row">
                                        <label class=" disabled"><input type="checkbox" disabled="" checked="" id="">
                                        </label>
                                        <label>Checked &amp; Disabled</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6">
                        <form class="form-horizontal bucket-form" method="get">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Radio</label>

                                <div class="col-sm-9 icheck minimal">
                                    <div class="radio single-row">
                                        <input tabindex="3" type="radio" name="demo-radio">
                                        <label>Checkbox 1</label>
                                    </div>

                                    <div class="radio single-row">
                                        <input tabindex="3" type="radio" name="demo-radio">
                                        <label>Checkbox 2</label>
                                    </div>

                                    <div class="radio single-row">
                                        <input tabindex="3" type="radio" name="demo-radio">
                                        <label>Checkbox 3</label>
                                    </div>

                                    <div class="radio single-row">
                                        <label class="disabled"><input type="radio" disabled=""></label>
                                        <label>Disabled</label>
                                    </div>


                                    <div class="radio checked single-row">
                                        <label class=" disabled"><input type="radio" disabled="" checked=""></label>
                                        <label>Checked &amp; Disabled</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<div class="row">
<div class="col-lg-12">
<section class="panel">
<header class="panel-heading">
    Different Color Custom Checkbox & Radio
</header>

<div class="panel-body">
<div class="row">
    <div class="col-md-6">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label">Checkboxes</label>

                <div class="col-sm-9 icheck ">

                    <div class="minimal single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Black Checkbox</label>
                        </div>
                    </div>

                    <div class="minimal-red single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Red Checkbox</label>
                        </div>
                    </div>

                    <div class="minimal-green single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Green Checkbox</label>
                        </div>
                    </div>

                    <div class="minimal-blue single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Blue Checkbox</label>
                        </div>
                    </div>

                    <div class="minimal-yellow single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Yellow Checkbox</label>
                        </div>
                    </div>

                    <div class="minimal-purple single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Purple Checkbox</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="col-md-6">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label">Checkboxes</label>

                <div class="col-sm-9 icheck ">

                    <div class="square single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Black Checkbox</label>
                        </div>
                    </div>

                    <div class="square-red single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Red Checkbox</label>
                        </div>
                    </div>

                    <div class="square-green single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Green Checkbox</label>
                        </div>
                    </div>

                    <div class="square-blue single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Blue Checkbox</label>
                        </div>
                    </div>

                    <div class="square-yellow single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Yellow Checkbox</label>
                        </div>
                    </div>

                    <div class="square-purple single-row">
                        <div class="checkbox ">
                            <input type="checkbox">
                            <label>Purple Checkbox</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<br>
<br>

<div class="row">
    <div class="col-md-6">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label">Radio</label>

                <div class="col-sm-9 icheck ">

                    <div class="minimal single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Black Radio</label>
                        </div>
                    </div>

                    <div class="minimal-red single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Red Radio</label>
                        </div>
                    </div>

                    <div class="minimal-green single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Green Radio</label>
                        </div>
                    </div>

                    <div class="minimal-blue single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Blue Radio</label>
                        </div>
                    </div>

                    <div class="minimal-yellow single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Yellow Radio</label>
                        </div>
                    </div>

                    <div class="minimal-purple single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Purple Radio</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="col-md-6">
        <form class="form-horizontal bucket-form" method="get">
            <div class="form-group">
                <label class="col-sm-3 control-label">Radio</label>

                <div class="col-sm-9 icheck ">

                    <div class="square single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Black Radio</label>
                        </div>
                    </div>

                    <div class="square-red single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Red Radio</label>
                        </div>
                    </div>

                    <div class="square-green single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Green Radio</label>
                        </div>
                    </div>

                    <div class="square-blue single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Blue Radio</label>
                        </div>
                    </div>

                    <div class="square-yellow single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Yellow Radio</label>
                        </div>
                    </div>

                    <div class="square-purple single-row">
                        <div class="radio ">
                            <input tabindex="3" type="radio" name="demo-radio">
                            <label>Purple Radio</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</section>
</div>
</div>

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                flat checkbox & radio
            </header>

            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <form class="form-horizontal bucket-form" method="get">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Radio</label>

                                <div class="col-sm-9 icheck ">

                                    <div class="flat-grey single-row">
                                        <div class="radio ">
                                            <input type="checkbox">
                                            <label>Black Checkbox</label>
                                        </div>
                                    </div>

                                    <div class="flat-red single-row">
                                        <div class="radio ">
                                            <input type="checkbox">
                                            <label>Red Checkbox</label>
                                        </div>
                                    </div>

                                    <div class="flat-green single-row">
                                        <div class="radio ">
                                            <input type="checkbox">
                                            <label>Green Checkbox</label>
                                        </div>
                                    </div>

                                    <div class="flat-blue single-row">
                                        <div class="radio ">
                                            <input type="checkbox">
                                            <label>Blue Checkbox</label>
                                        </div>
                                    </div>

                                    <div class="flat-yellow single-row">
                                        <div class="radio ">
                                            <input type="checkbox">
                                            <label>Yellow Checkbox</label>
                                        </div>
                                    </div>

                                    <div class="flat-purple single-row">
                                        <div class="radio ">
                                            <input type="checkbox">
                                            <label>Purple Checkbox</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6">
                        <form class="form-horizontal bucket-form" method="get">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Radio</label>

                                <div class="col-sm-9 icheck ">

                                    <div class="flat-grey single-row">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio" name="demo-radio">
                                            <label>Black Radio</label>
                                        </div>
                                    </div>

                                    <div class="flat-red single-row">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio" name="demo-radio">
                                            <label>Red Radio</label>
                                        </div>
                                    </div>

                                    <div class="flat-green single-row">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio" name="demo-radio">
                                            <label>Green Radio</label>
                                        </div>
                                    </div>

                                    <div class="flat-blue single-row">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio" name="demo-radio">
                                            <label>Blue Radio</label>
                                        </div>
                                    </div>

                                    <div class="flat-yellow single-row">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio" name="demo-radio">
                                            <label>Yellow Radio</label>
                                        </div>
                                    </div>

                                    <div class="flat-purple single-row">
                                        <div class="radio ">
                                            <input tabindex="3" type="radio" name="demo-radio">
                                            <label>Purple Radio</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Textarea
            </header>

            <div class="panel-body">
                <form class="form-horizontal bucket-form" method="get">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Textarea label</label>

                        <div class="col-sm-6">
                            <textarea class="form-control" rows="6"></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                CKEditor
            </header>

            <div class="panel-body">
                <div class="form">
                    <form action="#" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label col-sm-2">CKEditor</label>

                            <div class="col-sm-10">
                                <textarea class="form-control ckeditor" name="editor1" rows="6"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<div class="row">
    <div class="col-md-12">

        <div data-collapsed="0" class="panel">

            <div class="panel-heading">
                <div class="panel-title">
                    Input Grid
                </div>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-md-12 form-group">
                        <input type="text" placeholder=".col-md-12" class="form-control">
                    </div>

                    <div class="col-md-6 form-group">
                        <input type="text" placeholder=".col-md-6" class="form-control">
                    </div>

                    <div class="col-md-6 form-group">
                        <input type="text" placeholder=".col-md-6" class="form-control">
                    </div>


                    <div class="col-md-4 form-group">
                        <input type="text" placeholder=".col-md-4" class="form-control">
                    </div>

                    <div class="col-md-4 form-group">
                        <input type="text" placeholder=".col-md-4" class="form-control">
                    </div>

                    <div class="col-md-4 form-group">
                        <input type="text" placeholder=".col-md-4" class="form-control">
                    </div>


                    <div class="col-md-3 form-group">
                        <input type="text" placeholder=".col-md-3" class="form-control">
                    </div>

                    <div class="col-md-3 form-group">
                        <input type="text" placeholder=".col-md-3" class="form-control">
                    </div>

                    <div class="col-md-3 form-group">
                        <input type="text" placeholder=".col-md-3" class="form-control">
                    </div>

                    <div class="col-md-3 form-group">
                        <input type="text" placeholder=".col-md-3" class="form-control">
                    </div>


                    <div class="col-md-2 form-group">
                        <input type="text" placeholder=".col-md-2" class="form-control">
                    </div>

                    <div class="col-md-2 form-group">
                        <input type="text" placeholder=".col-md-2" class="form-control">
                    </div>

                    <div class="col-md-2 form-group">
                        <input type="text" placeholder=".col-md-2" class="form-control">
                    </div>

                    <div class="col-md-2 form-group">
                        <input type="text" placeholder=".col-md-2" class="form-control">
                    </div>

                    <div class="col-md-2 form-group">
                        <input type="text" placeholder=".col-md-2" class="form-control">
                    </div>

                    <div class="col-md-2 form-group">
                        <input type="text" placeholder=".col-md-2" class="form-control">
                    </div>


                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>

                    <div class="col-md-1 form-group">
                        <input type="text" placeholder=".col-md-1" class="form-control">
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>

<form role="form" action="">

</form>
<!-- page end-->

<div class="row">
<div class="col-sm-12">
<section class="panel">
<header class="panel-heading">
    Editable Table
    <span class="tools pull-right">
        <a href="javascript:;" class="fa fa-chevron-down"></a>
        <a href="javascript:;" class="fa fa-cog"></a>
        <a href="javascript:;" class="fa fa-times"></a>
    </span>
</header>

<div class="panel-body">
<div class="adv-table editable-table ">
<div class="clearfix">
    <div class="btn-group">
        <button id="editable-sample_new" class="btn btn-primary">
            Add New <i class="fa fa-plus"></i>
        </button>
    </div>

    <div class="btn-group pull-right">
        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
        </button>
        <ul class="dropdown-menu pull-right">
            <li><a href="#">Print</a></li>
            <li><a href="#">Save as PDF</a></li>
            <li><a href="#">Export to Excel</a></li>
        </ul>
    </div>
</div>

<div class="space15"></div>
<table class="table table-striped table-hover table-bordered" id="editable-sample">
<thead>
<tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Points</th>
    <th>Status</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>
</thead>
<tbody>
<tr class="">
    <td>Jonathan</td>
    <td>Smith</td>
    <td>3455</td>
    <td class="center">Lorem ipsume</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Mojela</td>
    <td>Firebox</td>
    <td>567</td>
    <td class="center">new user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Akuman</td>
    <td>Dareon</td>
    <td>987</td>
    <td class="center">ipsume dolor</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Theme</td>
    <td>Bucket</td>
    <td>342</td>
    <td class="center">Good Org</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Jhone</td>
    <td>Doe</td>
    <td>345</td>
    <td class="center">super user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Margarita</td>
    <td>Diar</td>
    <td>456</td>
    <td class="center">goolsd</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Jhon Doe</td>
    <td>Jhon Doe</td>
    <td>1234</td>
    <td class="center">user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Helena</td>
    <td>Fox</td>
    <td>456</td>
    <td class="center">Admin</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Aishmen</td>
    <td>Samuel</td>
    <td>435</td>
    <td class="center">super Admin</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>dream</td>
    <td>Land</td>
    <td>562</td>
    <td class="center">normal user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>babson</td>
    <td>milan</td>
    <td>567</td>
    <td class="center">nothing</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Waren</td>
    <td>gufet</td>
    <td>622</td>
    <td class="center">author</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Jhone</td>
    <td>Doe</td>
    <td>345</td>
    <td class="center">super user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Margarita</td>
    <td>Diar</td>
    <td>456</td>
    <td class="center">goolsd</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Jhon Doe</td>
    <td>Jhon Doe</td>
    <td>1234</td>
    <td class="center">user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Helena</td>
    <td>Fox</td>
    <td>456</td>
    <td class="center">Admin</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Aishmen</td>
    <td>Samuel</td>
    <td>435</td>
    <td class="center">super Admin</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>dream</td>
    <td>Land</td>
    <td>562</td>
    <td class="center">normal user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>babson</td>
    <td>milan</td>
    <td>567</td>
    <td class="center">nothing</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Waren</td>
    <td>gufet</td>
    <td>622</td>
    <td class="center">author</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Jhone</td>
    <td>Doe</td>
    <td>345</td>
    <td class="center">super user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Margarita</td>
    <td>Diar</td>
    <td>456</td>
    <td class="center">goolsd</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Jhon Doe</td>
    <td>Jhon Doe</td>
    <td>1234</td>
    <td class="center">user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Helena</td>
    <td>Fox</td>
    <td>456</td>
    <td class="center">Admin</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Aishmen</td>
    <td>Samuel</td>
    <td>435</td>
    <td class="center">super Admin</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>dream</td>
    <td>Land</td>
    <td>562</td>
    <td class="center">normal user</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>babson</td>
    <td>milan</td>
    <td>567</td>
    <td class="center">nothing</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
<tr class="">
    <td>Waren</td>
    <td>gufet</td>
    <td>622</td>
    <td class="center">author</td>
    <td><a class="edit" href="javascript:;">Edit</a></td>
    <td><a class="delete" href="javascript:;">Delete</a></td>
</tr>
</tbody>
</table>
</div>
</div>
</section>
</div>
</div>

<script>
    jQuery(document).ready(function() {
        EditableTable.init();
    });
</script>

</body>
</html>
