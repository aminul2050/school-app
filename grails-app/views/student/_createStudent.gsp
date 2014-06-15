<div class="row" id="studentCreate" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Student Admission &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Class Name: &nbsp;&nbsp;${section?.className.name} &nbsp;&nbsp;&nbsp;&nbsp; Section Name: &nbsp;&nbsp; ${section?.name}
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="create-form">
                        <g:hiddenField name="id"/>

                        <div class="form-group ">
                            <label for="details" class="control-label col-md-3">Student Name</label>
                            <div class="col-md-6">
                                <g:select id="e1" class="populate form-control" name='details'
                                          noSelection="${['': 'Select One...']}"
                                          from='${com.app.school.stmgmt.StudentDetails.list()}'
                                          optionKey="id" optionValue="nameWithId"></g:select>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="academicYear" class="control-label col-md-3">Academic Year</label>
                            <div class="col-md-6">
                                <input class=" form-control" id="academicYear" name="academicYear" type="text" value="2014"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="rollNumber" class="control-label col-md-3">Roll No</label>
                            <div class="col-md-6">
                                <input class=" form-control" id="rollNumber" name="rollNumber" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="admissionDate" class="control-label col-md-3">Admission Date</label>
                            <div class="col-md-6">
                                <input id="admissionDate" name="admissionDate" type="date"
                                       class="form-control datepicker"/>
                            </div>
                        </div>
                        <g:if test="${optionalSubjects}">
                            <div class="form-group ">
                                <label for="optionalSubjects" class="control-label col-md-3">Optional Subjects</label>

                                <div class="col-md-6">
                                    <g:select name="optionalSubjects" id="optionalSubjects" class="multi-select"
                                              multiple="multiple"
                                              optionKey="id"
                                              optionValue="subjectName"
                                              from="${optionalSubjects}"/>
                                </div>
                            </div>
                        </g:if>


                        <div class="form-group">
                            <div class="col-lg-offset-3 col-md-6">
                                <button class="btn btn-primary" type="submit">Save</button>
                                <button class="btn btn-default" type="reset">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<r:script>
$('#optionalSubjects').multiSelect();
    $('#admissionDate').datepicker({
            format: 'dd/mm/yyyy',
            startDate: '-3d',
            autoclose: true
            });
    $('#create-form').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            rollNumber: {
                required: true,
                number: true
            },
            academicYear: {
                required: true,
                number: true
            },
            admissionType: {
                required: true
            }
        },
        messages: {
            rollNumber: {
                required: "Roll Number is required"
            },
            academicYear: {
                required: "Academic Year is required"
            },
            admissionType: {
                required: "Admission Type is required"
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#currencyForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        submitHandler: function (form) {
            var subjectIds = $('[name="optionalSubjects"]').val();
            $.ajax({
                url: "${createLink(controller: 'student', action: 'save')}?subjectIds="+subjectIds+"&className="+className+"&section="+section,
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    $('#optionalSubjects').multiSelect('deselect_all');
                    $('#optionalSubjects').multiSelect('refresh');
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                    $.growl('Student Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
