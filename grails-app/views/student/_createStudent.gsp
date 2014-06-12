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
                        <g:hiddenField name="id" value="${section.id}"/>
                        <g:hiddenField name="sectionId" value="${section.className.id}"/>
                        <div class="form-group ">
                            <label for="details" class="control-label col-lg-3">Student Name</label>
                            <div class="col-lg-6">
                                <g:textField class="form-control" id="details" name="details"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="academicYear" class="control-label col-lg-3">Academic Year</label>

                            <div class="col-lg-6">
                                <input class=" form-control" id="academicYear" name="academicYear" type="text" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 col-sm-2 control-label">Basic select </label>
                            <div class="col-lg-6">
                                <g:select id="e1" class="populate " style="width: 300px" name='religion'
                                          noSelection="${['':'Select One...']}"
                                          from='${com.app.school.stmgmt.StudentDetails.list()}'
                                          optionKey="id" optionValue="fullName"></g:select>

                            </div>
                        </div>



                        <div class="form-group ">
                            <label for="studentNo" class="control-label col-lg-3">Roll No</label>
                            <div class="col-lg-6">
                                <input class=" form-control" id="studentNo" name="studentNo" type="text" />
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="admissionDate" class="control-label col-lg-3">Admission Date</label>
                            <div class="col-lg-6">
                                <input id="admissionDate" name="admissionDate" type="date" class="form-control datepicker"/>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="optionalSubjects" class="control-label col-lg-3">Optional Subjects</label>
                            <div class="col-lg-6">
                                <g:select name="optionalSubjects"
                                          multiple="multiple"
                                          optionKey="id"
                                          optionValue="subjectName"
                                          from="${optionalSubjects}"
                                          value="" />

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-3 col-lg-6">
                                <button class="btn btn-primary" type="submit">Save</button>
                                <button class="btn btn-default" type="button">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<r:script>
var demo1 = $('[name="optionalSubjects"]').bootstrapDualListbox();
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
            details: {
                required: true,
                maxlength: 200
            },
            description: {
                minlength: 0,
                maxlength: 200
            }
        },
        messages: {
            name: {
                required: "Class Name required"
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
                url: "${createLink(controller: 'student', action: 'save')}?subjectIds="+subjectIds,
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
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
