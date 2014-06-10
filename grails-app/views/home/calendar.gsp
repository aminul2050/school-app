<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Calender - Edupal.co</title>
    <!--calendar css-->

</head>
<body>
        <section class="panel">
            <header class="panel-heading">
                Show class routine and exam schedule
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-cog"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                </span>
            </header>
            <div class="panel-body">
                <!-- page start-->
                <div class="row">
                    <aside class="col-lg-9">
                        <div id="calendar" class="has-toolbar"></div>
                    </aside>
                    <aside class="col-lg-3">
                        <h4 class="drg-event-title">Custom Events</h4>
                        <div id='external-events'>
                            <div class='external-event label label-primary'>My Event 1</div>
                            <div class='external-event label label-success'>My Event 2</div>
                            <div class='external-event label label-info'>My Event 3</div>
                            <div class='external-event label label-inverse'>My Event 4</div>
                            <p class="border-top drp-rmv">
                                <input type='checkbox' id='drop-remove' checked/>
                                Show Class Times
                            </p>
                              <p class="border-top drp-rmv">
                                <input type='checkbox' id='drop-remove' checked/>
                                Show Quizzes
                            </p>
                            <p class="border-top drp-rmv">
                                <input type='checkbox' id='drop-remove' checked/>
                                Show Exams
                            </p>
                             <p class="border-top drp-rmv">
                                <input type='checkbox' id='drop-remove' checked/>
                                Show off day
                            </p>

                        </div>
                    </aside>
                </div>
                <!-- page end-->
            </div>
        </section>
</body>
</html>
