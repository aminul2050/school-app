<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Student Admission - Baily School</title>
</head>
<body>
<g:render template="createStudent"/>

<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Admission
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
                            <th>Student Name</th>
                            <th>Class Name</th>
                            <th>Section Name</th>
                            <th>Academic Year</th>
                            <th>Roll Number</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="student">
                            <tr>
                                <td>${student[0]}</td>
                                <td>${student[1]}</td>
                                <td>${student[2]}</td>
                                <td>${student[3]}</td>
                                <td>${student[4]}</td>
                                <td>${student[5]}</td>
                                <td>
                                    <sec:access controller="student" action="edit">
                                        <span class="col-xs-6"><a href="" referenceId="${student.DT_RowId}" class="edit-reference" title="Edit"><span class="green glyphicon glyphicon-edit"></span>&nbsp;Edit&nbsp;</a></span>
                                    </sec:access>
                                    <sec:access controller="student" action="delete">
                                        <span class="col-xs-6"><a href="" referenceId="${student.DT_RowId}" class="delete-reference" title="Delete"><span class="green glyphicon glyphicon-trash"></span>&nbsp;Delete&nbsp;</a></span>
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
    var className, section;
    jQuery(function ($) {
    className=${className.id};
    section = ${section.id};
        var oTable1 = $('#list-table').dataTable({
//            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
//            "bProcessing": true,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'student',action: 'list')}?classId="+className+"&sectionId="+section,
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
                null,
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#add-new-btn').click(function (e) {
            $("#studentCreate").toggle(500);
            e.preventDefault();
        });
        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                dataType:'JSON',
                url: "${g.createLink(controller: 'student',action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if(data.isError==false){
                            clearForm('#create-form');
                            $('#optionalSubjects').multiSelect('deselect_all');
                            $('#id').val(data.obj.id);
                            $('#className').val(data.obj.className.name);
                            $('#section').val(data.obj.section);
                            $('#academicYear').val(data.obj.academicYear);
                            $('#details').val(data.obj.details.fullName);
                            $('#studentNo').val(data.obj.studentNo);

                            var subjectIds =data.obj.subjectIds;
                            var numbersArray = subjectIds.split(',');
                            $('#optionalSubjects').multiSelect('select',numbersArray);
                            $('#optionalSubjects').multiSelect('refresh');
                            $("#studentCreate").show(500);
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
                    url: "${g.createLink(controller: 'student',action: 'delete')}?id=" + referenceId,
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
        actionButtons += '<sec:access controller="student" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="student" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }
</r:script>

</body>
</html>
