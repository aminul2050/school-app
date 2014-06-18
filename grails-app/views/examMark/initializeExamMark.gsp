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
                Exam Mark Entry List
            </header>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="list-table">
                        <thead>
                        <tr>
                            <th>Serial</th>
                            <th>Class</th>
                            <th>Section</th>
                            <th>Exam Type</th>
                            <th>Exam Name</th>
                            <th>Subject</th>
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
                                <td>${examIni[4]}</td>
                                <td>
                                    <g:select class="form-control" id="subjectId${examIni.DT_RowId}" name='subjectId'
                                              noSelection="${['':'Select One...']}"
                                              from='${examIni[5]}'
                                              optionKey="id" optionValue="name"></g:select>
                                </td>
                                <td>${examIni[6]}</td>
                                <td>
                                    <sec:access controller="examMark" action="entry">
                                        <span class="col-md-12"><a href="" referenceId="${examIni.DT_RowId}" class="edit-reference" title="Entry Exam Mark"><span class="green glyphicon glyphicon-edit"></span>&nbsp;Entry Mark&nbsp;</a></span>
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
             var oTable1 = $('#list-table').dataTable({});
        $('#list-table').on('click', 'a.edit-reference', function (e) {
            var control = this;
            var referenceId = $(control).attr('referenceId');
            var subjectId = $('#subjectId'+referenceId).val();
            if(subjectId ==null || subjectId ==''){
                alert("Select subject to entry mark");
                return false;
            }
            window.location.href = '${g.createLink(controller: "examMark",action: 'entry')}?id='+referenceId+'&subjectId='+subjectId;
            e.preventDefault();
        });
    });

</r:script>

</body>
</html>
