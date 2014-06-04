<div class="row" id="studentCreate" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Create Admission
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="create-form">
                        <g:hiddenField name="id"/>

                        <div class="form-group ">
                            <label for="details" class="control-label col-lg-3">Student Name</label>
                            <div class="col-lg-6">
                                <g:textField class="form-control" id="details" name="details"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="className" class="control-label col-lg-3">Class Name</label>
                            <div class="col-lg-6">

                                <g:select class=" form-control" id="className" name='className' value=""
                                          noSelection="${['null':'Select One...']}"
                                          from=''
                                          optionKey="id" optionValue="name"></g:select>



                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="section" class="control-label col-lg-3">Section Name</label>
                            <div class="col-lg-6">

                                <g:select class=" form-control" id="section" name='section' value=""
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.settings.Section.list()}'
                                          optionKey="id" optionValue="name"></g:select>

                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="academicYear" class="control-label col-lg-3">Academic Year</label>

                            <div class="col-lg-6">
                                <input class=" form-control" id="academicYear" name="academicYear" type="text" />
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
                                <input type="date" id="admissionDate" name="admissionDate"
                                       class="form-control datepicker" data-date-format="dd/mm/yyyy"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="admissionType" class="control-label col-lg-3">Admission Type</label>
                            <div class="col-lg-6">

                                <g:select class=" form-control" id="admissionType" name='admissionType' value=""
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.enums.AdmissionType.values()}'
                                          optionKey="key" optionValue="value"></g:select>

                                %{--<g:select name="defaultVat" id="defaultVat" class="form-control"--}%
                                          %{--noSelection="['': 'Choose Default Vat']"--}%
                                          %{--from="${DefaultVat.values()}"--}%
                                          %{--value="${bankSetupData?.defaultVat}"--}%
                                          %{--optionKey="value" optionValue="value"></g:select>--}%

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
    $('#create-form').validate({
        errorElement: 'small',
        errorSchool: 'help-block',
        focusInvalid: false,
        rules: {
            student: {
                required: true,
                minlength: 4,
                maxlength: 15
            },
            details: {
                minlength: 5,
                maxlength: 225
            }
        },
        messages: {
            student: {
                required: "School Name required"
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#currencyForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeSchool('has-info').addSchool('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeSchool('has-error').addSchool('has-info');
            $(e).remove();
        },
        submitHandler: function (form) {
            $.ajax({
                url: "${createLink(controller: 'student', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
