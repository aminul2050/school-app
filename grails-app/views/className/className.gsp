<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="settings-tpl"/>
    <title>Empty page - Edupal.co</title>

</head>
<body>
<g:render template="createClassName"/>

<div class="row">
<div class="col-sm-12">
<section class="panel">
<header class="panel-heading">
    Class Name List
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
    <th>Name</th>
    <th>Description</th>
    <th>Action</th>
</tr>
</thead>
<tbody>
<g:each in="${dataReturn}" var="className">
    <tr>
        <td>${className[0]}</td>
        <td>${className[1]}</td>
        <td>${className[2]}</td>
        <td>
            <sec:access controller="className" action="edit">
                <span class="col-xs-6"><a href="" referenceId="${className.DT_RowId}" class="edit-reference" title="Edit"><span class="green glyphicon glyphicon-edit"></span></a></span>
            </sec:access>
            <sec:access controller="className" action="delete">
                <span class="col-xs-6"><a href="" referenceId="${className.DT_RowId}" class="delete-reference" title="Delete"><span class="red glyphicon glyphicon-trash"></span></a></span>
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
            "bProcessing": false,
            "bAutoWidth": true,
            "bServerSide": true,
            "deferLoading": ${totalCount},
            "sAjaxSource": "${g.createLink(controller: 'className',action: 'list')}",
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
//            document.getElementById(classNameCreate).style.display = 'block';
        $("#classNameCreate").toggle(1000);
            e.preventDefault();
        });
        $('#sample-table-2').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            jQuery.ajax({
                type: 'POST',
                url: "${g.createLink(controller: 'currency',action: 'update')}?id=" + referenceId,
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
                    url: "${g.createLink(controller: 'currency',action: 'delete')}?id=" + referenceId,
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
        actionButtons += '<sec:access controller="className" action="edit"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="edit-reference" title="Edit">';
        actionButtons += '<span class="green glyphicon glyphicon-edit"></span>';
        actionButtons += '</a></span></sec:access>';
        actionButtons += '<sec:access controller="className" action="delete"><span class="col-xs-6"><a href="" referenceId="' + aData.DT_RowId + '" class="delete-reference" title="Delete">';
        actionButtons += '<span class="red glyphicon glyphicon-trash"></span>';
        actionButtons += '</a></span></sec:access>';
        return actionButtons;
    }
</r:script>

</body>
</html>
