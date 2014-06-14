<style type="text/css">
ul.sidebar-menu li ul.sub li a:hover, ul.sidebar-menu li ul.sub li a.active {
    background: none repeat scroll 0 0 #202025;
    color: #1FB5AD;
    display: block;
    transition: all 0.3s ease 0s;
}
</style>
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
                <li><a href="${g.createLink(controller: 'className',action: 'index')}">Add Class Name</a></li>
                <li><a href="${g.createLink(controller: 'subject',action: 'index')}">Add Subject</a></li>
                <li><a href="${g.createLink(controller: 'section',action: 'index')}">Add Section</a></li>
                <li><a href="${g.createLink(controller: 'classSubject',action: 'index')}">Add Subject to Class</a></li>
            </ul>
        </li>
        <li class="sub-menu">
            <a href="javascript:;">
                <i class="fa fa-laptop"></i>
                <span>Exam</span>
            </a>
            <ul class="sub">
                <li><a href="${g.createLink(controller: 'exam',action: 'index')}">Create Exam</a></li>
                <li><a href="${g.createLink(controller: 'examMark',action: 'index')}">Add Exam Mark</a></li>
            </ul>
        </li>
        <li class="sub-menu">
            <a href="javascript:;">
                <i class="fa fa-laptop"></i>
                <span>Student Mgmt</span>
            </a>
            <ul class="sub">
                <li><a href="${g.createLink(controller: 'studentDetails',action: 'index')}">Student Entry</a></li>
                <li><a href="${g.createLink(controller: 'student',action: 'index')}">Student Admission</a></li>
            </ul>
        </li>
    </ul></div>
</div>
<r:script>
    jQuery(function ($) {
        $('#nav-accordion').dcAccordion({
            eventType: 'click',
            autoClose: true,
            saveState: true,
            disableLink: true,
            speed: 'fast',
            showCount: true,
            autoExpand: true,
            classExpand: 'dcjq-current-parent'
        });

    });
</r:script>
