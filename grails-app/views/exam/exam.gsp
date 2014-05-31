<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Create Exam</title>

</head>

<body>
<g:render template="createExam"/>

<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Exam List
                <span class="tools pull-right">
                    <div class="btn-group">
                        <button id="add-new-btn" class="btn btn-primary">
                            Add New<i class="fa fa-plus"></i>
                        </button>
                    </div>
                </span>
            </header>

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="list-table">
                        <thead>
                        <tr>
                            <th>Serial</th>
                            <th>Class Name</th>
                            <th>Section</th>
                            <th>Exam Type</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Publish Date</th>
                            <th>Exam Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="exam">
                            <tr>
                                <td>${exam[0]}</td>
                                <td>${exam[1]}</td>
                                <td>${exam[2]}</td>
                                <td>${exam[3]}</td>
                                <td>${exam[4]}</td>
                                <td>${exam[5]}</td>
                                <td>${exam[6]}</td>
                                <td>${exam[7]}</td>
                                <td>
                                    <sec:access controller="subjectName" action="edit">
                                        <span class="col-xs-6"><a href="" referenceId="${exam.DT_RowId}"
                                                                  class="edit-reference" title="Edit"><span
                                                    class="green glyphicon glyphicon-edit"></span></a></span>
                                    </sec:access>
                                    <sec:access controller="subjectName" action="delete">
                                        <span class="col-xs-6"><a href="" referenceId="${exam.DT_RowId}"
                                                                  class="delete-reference" title="Delete"><span
                                                    class="red glyphicon glyphicon-trash"></span></a></span>
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
    %{--var beginDate = "${beginingDate}";--}%
%{--$("#beginingDate").val(beginDate);--}%

    //date picker object
     $("#dateBegin").datepicker({
    //            format: dateF,
                startDate: date,
                gotoCurrent: true,
                stepMonths: 1,
                minDate: new Date(),
                autoclose: true
            });
            var oTable1 = $('#list-table').dataTable({
    //            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
                "bProcessing": false,
                "bAutoWidth": true,
                "bServerSide": true,
                "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'exam', action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if(aData.DT_RowId ==undefined){
                    return true;
                }
                $('td:eq(3)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#add-new-btn').click(function (e) {
//            document.getElementById(examCreate).style.display = 'block';
        $("#examCreate").toggle(1000);
            e.preventDefault();
        });
        $('#sample-table-2').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'currency', action: 'update')}?id=" + referenceId,
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            e.preventDefault();
        });

        $('#sample-table-2').on('click', 'a.delete-reference', function (e) {
            var selectRow = $(this).parents('tr');
            var confirmDel = confirm("Do You Want To Delete?");
            if (confirmDel == true) {
                var control = this;
                var referenceId = $(control).attr('referenceId');
                jQuery.ajax({
                    type: 'POST',
                    dataType:'JSON',
                    url: "${g.createLink(controller: 'currency', action: 'delete')}?id=" + referenceId,
                    success: function (data, textStatus) {
                        if(data.isError==false){
                            $("#sample-table-2").DataTable().row(selectRow).remove().draw();
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
// $('#'+updateDiv).html(data);
                    }
                });
            }
            e.preventDefault();
        });
    });

    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<sec:access controller="exam" action="edit"><span class="col-xs-6"><a href=""
                                                                                                referenceId="' + aData.DT_RowId + '"
                                                                                                class="edit-reference"
                                                                                                title="Edit">';
    actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
    actionButtons += '</a></span></sec:access>';
        actionButtons += '<sec:access controller="exam" action="delete"><span class="col-xs-6"><a href=""
                                                                                                  referenceId="' + aData.DT_RowId + '"
                                                                                                  class="delete-reference"
                                                                                                  title="Delete">';
    actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
    actionButtons += '</a></span></sec:access>';
        return actionButtons;
    }
</r:script>

</body>
</html>
