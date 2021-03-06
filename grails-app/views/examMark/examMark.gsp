<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Entry Mark - Baily School</title>

</head>
<body>
<g:render template="createExamMark"/>

<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Add Mark
                <span class="tools pull-right">
                    <div class="form-group">

                        <button id="mark-complete" class="btn btn-primary">
                            Mark Complete<i class="fa fa-compress"></i>
                        </button>&nbsp;&nbsp;

                        <div class="btn-group">
                            <button id="download-mark" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Download Mark <i class="fa fa-angle-down"></i>
                         </button>&nbsp;&nbsp;
                            <ul class="dropdown-menu pull-right">
                                <li><a href="#">Print</a></li>
                                <li><a href="#">Save as PDF</a></li>
                                <li><a href="#">Export to Excel</a></li>
                            </ul>
                        </div>

                        <button id="add-new-btn" class="btn btn-primary">
                            Add New<i class="fa fa-plus"></i>
                        </button>&nbsp;&nbsp;

                    </div>
                </span>
            </header>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="list-table">
                        <thead>
                        <tr>
                            <th>Serial</th>
                            <th>StudentName</th>
                            <th>Mark</th>
                            <th>GPA</th>
                            <th>Grade</th>
                            <th>Comments</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="examMark">
                            <tr>
                                <td>${examMark[0]}</td>
                                <td>${examMark[1]}</td>
                                <td>${examMark[2]}</td>
                                <td>${examMark[3]}</td>
                                <td>${examMark[4]}</td>
                                <td>${examMark[5]}</td>
                                <td>
                                    <sec:access controller="examMark" action="edit">
                                        <span class="col-xs-6"><a href="" referenceId="${examMark.DT_RowId}" class="edit-reference" title="Edit"><span class="green glyphicon glyphicon-edit"></span>&nbsp;Edit&nbsp;</a></span>
                                    </sec:access>
                                    <sec:access controller="examMark" action="delete">
                                        <span class="col-xs-6"><a href="" referenceId="${examMark.DT_RowId}" class="delete-reference" title="Delete"><span class="green glyphicon glyphicon-trash"></span>&nbsp;Delete&nbsp;</a></span>
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
   var exam, subject;
    jQuery(function ($) {
        exam=${exam.id};
        subject = ${subject.id};
        $("#student").select2()
        var oTable1 = $('#list-table').dataTable({
//            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
//            "bProcessing": true,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'examMark',action: 'list')}?examId="+exam+"&subjectId="+subject,
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if(aData.DT_RowId ==undefined){
                    return true;
                }
                $('td:eq(6)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                null,
                null,
                { "bSortable": false },
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#add-new-btn').click(function (e) {
            $("#examMarkCreate").toggle(500);
            e.preventDefault();
        });

        $('#mark-complete').click(function (e) {
            window.location.href = '${g.createLink(controller: "examMark",action: 'markComplete')}?id='+exam+'&subjectId='+subject;
            e.preventDefault();
        });

        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                dataType:'JSON',
                url: "${g.createLink(controller: 'examMark',action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if(data.isError==false){
                            clearForm('#create-form');
                            $('#id').val(data.obj.id);
                            $('#name').val(data.obj.name);
                            $('#mark').val(data.obj.mark);
                            $('#description').val(data.obj.description);
                            $("#examMarkCreate").show(500);
                        }else{
                            alert(data.message);
                        }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            e.preventDefault();
        });

        $('#list-table').on('click', 'a.delete-reference', function (e) {
            var selectRow = $(this).parents('tr');
            var confirmDel = confirm("Are you sure?");
            if (confirmDel == true) {
                var control = this;
                var referenceId = $(control).attr('referenceId');
                jQuery.ajax({
                    type: 'POST',
                    dataType:'JSON',
                    url: "${g.createLink(controller: 'examMark',action: 'delete')}?id=" + referenceId,
                    success: function (data, textStatus) {
                        if(data.isError==false){
                            $("#list-table").DataTable().row(selectRow).remove().draw();
                        }else{
                            alert(data.message);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            e.preventDefault();
        });
    });

    function getActionButtons(nRow, aData) {
        var actionButtons = "";
        actionButtons += '<sec:access controller="examMark" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="examMark" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }
</r:script>

</body>
</html>
