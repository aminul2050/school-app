<ul class="nav pull-right top-menu">
    <li>
        <a href="${g.createLink(controller: 'className',action: 'index')}">Settings</a>
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