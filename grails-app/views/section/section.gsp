<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Create Section</title>

</head>

<body>
<g:render template="createSection"/>

<div class="row">

    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Section List
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
                            <th>Section Name</th>
                            <th>Section Description</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${dataReturn}" var="section">
                            <tr>
                                <td>${section[0]}</td>
                                <td>${section[1]}</td>
                                <td>${section[2]}</td>
                                <td>${section[3]}</td>
                                <td>
                                    <sec:access controller="section" action="edit">
                                        <span class="col-xs-6"><a href="" referenceId="${section.DT_RowId}"
                                                                  class="edit-reference" title="Edit"><span
                                                    class="green glyphicon glyphicon-edit"></span>&nbsp;Edit&nbsp;</a>
                                        </span>
                                    </sec:access>
                                    <sec:access controller="section" action="delete">
                                        <span class="col-xs-6"><a href="" referenceId="${section.DT_RowId}"
                                                                  class="delete-reference" title="Delete"><span
                                                    class="green glyphicon glyphicon-trash"></span>&nbsp;Delete&nbsp;
                                        </a></span>
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
            "sAjaxSource": "${g.createLink(controller: 'section', action: 'list')}",
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                if(aData.DT_RowId ==undefined){
                    return true;
                }
                $('td:eq(4)', nRow).html(getActionButtons(nRow, aData));
                return nRow;
            },
            "aoColumns": [
                null,
                null,
                { "bSortable": false },
                { "bSortable": false },
                { "bSortable": false }

            ]
        });
        $('#add-new-btn').click(function (e) {
            $("#sectionCreate").toggle(1000);
            e.preventDefault();
        });
        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                dataType:'JSON',
                url: "${g.createLink(controller: 'section', action: 'edit')}?id=" + referenceId,
                success: function (data, textStatus) {
                    if(data.isError==false){
                            clearForm('#create-form');
                            $('#id').val(data.obj.id);
                            $('#name').val(data.obj.name);
                            $('#className').val(data.obj.className.name);
                            $('#description').val(data.obj.description);
                            $("#sectionCreate").show(1000);
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
                    url: "${g.createLink(controller: 'section',action: 'delete')}?id=" + referenceId,
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
        actionButtons += '<sec:access controller="section" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
actionButtons += '&nbsp;Edit&nbsp;</a></span></sec:access>';
        actionButtons += '<sec:access controller="section" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
actionButtons += '&nbsp;Delete&nbsp;</a></span></sec:access>';
        return actionButtons;
    }

</r:script>

</body>
</html>
