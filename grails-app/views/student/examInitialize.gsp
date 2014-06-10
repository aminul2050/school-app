<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Create Section</title>
</head>

<body>

<div class="row">

    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Section List
            </header>

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="list-table">
                        <thead>
                        <tr>
                            <th>Serial</th>
                            <th>Class Name</th>
                            <th>Section Name</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="section">
                            <tr>
                                <td>${section[0]}</td>
                                <td>${section[1]}</td>
                                <td>${section[2]}</td>
                                <td>
                                    <sec:access controller="student" action="admissionSave">
                                        <span class="col-xs-4"><a href="${g.createLink(controller: 'student',action: 'admission', params: [id:section.DT_RowId, type:'Admission'])}"
                                                                  class="edit-reference" title="Add"><span
                                                    class="green glyphicon glyphicon-edit"></span>&nbsp;Admission&nbsp;</a>
                                        </span>
                                        <span class="col-xs-4"><a href="${g.createLink(controller: 'student',action: 'admission', params: [id:section.DT_RowId, type:'ReAdmission'])}"
                                                                  class="edit-reference" title="Add"><span
                                                    class="green glyphicon glyphicon-edit"></span>&nbsp;Re Admission&nbsp;</a>
                                        </span>
                                        <span class="col-xs-4"><a href="${g.createLink(controller: 'student',action: 'admission', params: [id:section.DT_RowId, type:'Promotion'])}"
                                                                  class="edit-reference" title="Add"><span
                                                    class="green glyphicon glyphicon-edit"></span>&nbsp;Promotion&nbsp;</a>
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

    var oTable1 = $('#list-table').dataTable();

    });

    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<sec:access controller="section" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        return actionButtons;
    }

</r:script>

</body>
</html>
