<div id="sidebar" class="nav-collapse">
<div class="leftside-navigation">
    <ul class="sidebar-menu" id="nav-accordion">
        <li>
            <a href="${g.createLink(controller: 'home',action: 'index')}">
                <i class="fa fa-dashboard"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="sub-menu">
            <a href="javascript:;">
                <i class="fa fa-laptop"></i>
                <span>Settings</span>
            </a>
            <ul class="sub">
                <li><a data-linkTo="className" href="${g.createLink(controller: 'className',action: 'index')}">Add Class Name</a></li>
                <li><a data-linkTo="subject" href="${g.createLink(controller: 'subject',action: 'index')}">Add Subject</a></li>
                <li><a data-linkTo="section" href="${g.createLink(controller: 'section',action: 'index')}">Add Section</a></li>
                <li><a data-linkTo="classSubject" href="${g.createLink(controller: 'classSubject',action: 'index')}">Add Subject to Class</a></li>
            </ul>
        </li>
        <li class="sub-menu">
            <a href="javascript:;">
                <i class="fa fa-laptop"></i>
                <span>Exam</span>
            </a>
            <ul class="sub">
                <li><a data-linkTo="exam" href="${g.createLink(controller: 'exam',action: 'index')}">Create Exam</a></li>
                <li><a data-linkTo="examMark" href="${g.createLink(controller: 'examMark',action: 'index')}">Add Exam Mark</a></li>
            </ul>
        </li>
        <li class="sub-menu">
            <a href="javascript:;">
                <i class="fa fa-laptop"></i>
                <span>Student Mgmt</span>
            </a>
            <ul class="sub">
                <li><a data-linkTo="studentDetails" href="${g.createLink(controller: 'studentDetails',action: 'index')}">New Entry</a></li>
            </ul>
        </li>
    </ul></div>
</div>
<r:script>
    jQuery(function ($) {
        var topMenu = $("#sidebar ul.sidebar-menu");
//        var singleMenuItems = ["home", "openaccount"]; // need to provided by programmer manually
        topMenu.find("li").removeClass("open").removeClass("active"); // remove previous active link
        var loc = document.URL;
        loc = loc.replace(/.*?:\/\//g, "");  // remove "htpp://"
        loc = loc.replace("localhost/", ""); // remove "localhost/"
        loc = loc.replace("school-app/", ""); // remove
        loc = loc.split('/');     // split by "/"
        var controllerName = loc[1];
        //var actionName = loc[2];
        if (controllerName) {
            topMenu.find("li a").each(function () {
                var menuLinkName = $(this).attr('data-linkTo');
                if(menuLinkName==controllerName) {
//                    $(this).parent("li").addClass("active");
                    $(this).addClass("active");
//                    $(this).closest('ul').parent("li").addClass("open").addClass("active");
                }
            });
        }else{
            $('#sidebar ul.sidebar-menu li').first().find("a").addClass('active');
        }

    });
</r:script>
