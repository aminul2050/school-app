<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Student Detail</title>

</head>
<body>
<g:render template="createStudentDetails"/>

<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Student List
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
                            <th>Student Id</th>
                            <th>Student Full Name</th>
                            <th>Email</th>
                            <th>Card No</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="studentDetails">
                            <tr>
                                <td>${studentDetails[0]}</td>
                                <td>${studentDetails[1]}</td>
                                <td>${studentDetails[2]}</td>
                                <td>${studentDetails[3]}</td>
                                <td>${studentDetails[4]}</td>
                                <td>
                                    <sec:access controller="studentDetails" action="edit">
                                        <span class="col-xs-6"><a href="" referenceId="${studentDetails.DT_RowId}" class="edit-reference" title="Edit"><span class="green glyphicon glyphicon-edit"></span>&nbsp;Edit&nbsp;</a></span>
                                    </sec:access>
                                    <sec:access controller="studentDetails" action="delete">
                                        <span class="col-xs-6"><a href="" referenceId="${studentDetails.DT_RowId}" class="delete-reference" title="Delete"><span class="green glyphicon glyphicon-trash"></span>&nbsp;Delete&nbsp;</a></span>
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
//            "sDom": "<'row'<'col-md-4'><'col-md-4'><'col-md-4'f>r>t<'row'<'col-md-4'l><'col-md-4'i><'col-md-4'p>>",
//            "bProcessing": true,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'studentDetails',action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if(aData.DT_RowId ==undefined){
                    return true;
                }
                $('td:eq(5)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                null,
                null,
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#add-new-btn').click(function (e) {
            $("#createStudentDetails").toggle(1000);
            e.preventDefault();
        });
        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                dataType:'JSON',
                url: "${g.createLink(controller: 'studentDetails',action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if(data.isError==false){
                            clearForm('#create-form');
                            $('#id').val(data.obj.id);
                            $('#studentID').val(data.obj.studentID);
                            $('#firstName').val(data.obj.firstName);
                            $('#lastName').val(data.obj.lastName);
                            $('#nickName').val(data.obj.nickName);
                            $('#fatherName').val(data.obj.fatherName);
                            $('#motherName').val(data.obj.motherName);
                            $('#birthDate').val(data.obj.birthDate);
                            $('#bloodGroup').val(data.obj.bloodGroup);
                            $('#email').val(data.obj.email);
                            $('#mobileNo').val(data.obj.mobileNo);
                            $('#cardNo').val(data.obj.cardNo);
                            $('#imagePath').val(data.obj.imagePath);
                            $('#religion').val(data.obj.religion.name);
                            $('#presentAddress').val(data.obj.presentAddress);
                            $('#permanentAddress').val(data.obj.permanentAddress);
                            $('#fathersProfession').val(data.obj.fathersProfession);
                            $('#mothersProfession').val(data.obj.mothersProfession);
                            $('#fatherAvgIncome').val(data.obj.fatherAvgIncome);
                            $("#createStudentDetails").show(1000);
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
                    url: "${g.createLink(controller: 'studentDetails',action: 'delete')}?id=" + referenceId,
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
        actionButtons += '<sec:access controller="studentDetails" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="studentDetails" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }
</r:script>

</body>
</html>
