<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Select Exam.</title>

</head>
<body>
%{--<g:render template="createClassName"/>--}%

<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Exam List
            </header>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="list-table">
                        <thead>
                        <tr>
                            <th>Serial</th>
                            <th>Class</th>
                            <th>Section</th>
                            <th>Exam Name</th>
                            <th>Subject</th>
                            <th>Start Date</th>
                            <th>Exam Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="examIni" status="i">
                            <tr>
                                <td>${examIni[0]}</td>
                                <td>${examIni[1]}</td>
                                <td>${examIni[2]}</td>
                                <td>${examIni[3]}</td>
                                <td>
                                    <g:select class=" form-control" id="religion" name='religion'
                                              noSelection="${['':'Select One...']}"
                                              from='${com.app.school.enums.Religion.values()}'
                                              optionKey="key" optionValue="value"></g:select>
                                </td>
                                <td>${examIni[4]}</td>
                                <td>${examIni[5]}</td>
                                <td>
                                    <sec:access controller="student" action="admissionSave">
                                        <span class="col-xs-12"><a href="${g.createLink(controller: 'examMark',action: 'entry', params: [id:examIni.DT_RowId])}"
                                                                  class="edit-reference" title="Add"><span
                                                    class="green glyphicon glyphicon-edit"></span>&nbsp;Entry&nbsp;</a>
                                        </span>
                                    </sec:access>
                                </td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- page end-->

<r:script>
    jQuery(function ($) {

             var oTable1 = $('#list-table').dataTable({
        });

    });

</r:script>

</body>
</html>
