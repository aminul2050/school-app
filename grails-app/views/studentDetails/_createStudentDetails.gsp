<div class="row" id="createStudentDetails" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Add new Student
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>

            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="create-form">
                        <g:hiddenField name="id"/>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="studentID" class="control-label4">Student ID *</label>
                                <g:textField class="form-control" id="studentID" tabindex="1" name="studentID"
                                             placeholder="Enter Student ID."/>
                                <span for="studentID" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="firstName" class="control-label">First Name *</label>
                                <g:textField class="form-control" id="firstName" tabindex="2" name="firstName"
                                             placeholder="Enter First Name."/>
                                <span for="studentID" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="lastName" class="control-label">Last Name *</label>
                                <g:textField class="form-control" id="lastName" tabindex="3" name="lastName"
                                             placeholder="Enter Last Name."/>
                                <span for="lastName" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="nickName" class="control-label">Nic Name</label>
                                <g:textField class="form-control" id="nickName" tabindex="4" name="nickName"
                                             placeholder="Enter Nick Name."/>
                                <span for="nickName" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="fatherName" class="control-label">Fathers Name</label>
                                <g:textField class="form-control" id="fatherName" tabindex="5" name="fatherName"
                                             placeholder="Enter Fathers Name."/>
                                <span for="nickName" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="motherName" class="control-label">Mothers Name</label>
                                <g:textField class="form-control" id="motherName" tabindex="6" name="motherName"
                                             placeholder="Enter Mothers Name."/>
                                <span for="nickName" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="datepicker" class="control-label">Birth Date</label>
                                <g:textField class="form-control" id="datepicker" tabindex="7" name="birthDate"
                                             placeholder="Enter Birth Date."/>
                                <span for="datepicker" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="bloodGroup" class="control-label">Blood Group</label>
                                <g:textField class="form-control" id="bloodGroup" tabindex="8" name="bloodGroup"
                                             placeholder="Enter Blood Group."/>
                                <span for="bloodGroup" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="email" class="control-label ">Email</label>
                                <g:textField class="form-control" id="email" tabindex="9" name="email"
                                             placeholder="Enter Email."/>
                                <span for="email" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="mobileNo" class="control-label">Contact Number</label>
                                <g:textField class="form-control" id="mobileNo" tabindex="10" name="mobileNo"
                                             placeholder="Enter Email."/>
                                <span for="mobileNo" class="help-block"></span>
                            </div>
                        </div>


                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="cardNo" class="control-label">Card Number</label>
                                <g:textField class="form-control" id="cardNo" tabindex="11" name="cardNo"
                                             placeholder="Enter Card Number."/>
                                <span for="cardNo" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="imagePath" class="control-label">Image Path</label>

                                <g:textField class="form-control" id="imagePath" tabindex="12" name="imagePath"
                                             placeholder="Enter Image Path."/>
                                <span for="imagePath" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="religion" class="control-label">Religion</label>
                                <g:select class=" form-control" id="religion" name='religion' tabindex="13"
                                          noSelection="${['': 'Select One...']}"
                                          from='${com.app.school.enums.Religion.values()}'
                                          optionKey="key" optionValue="value"></g:select>
                                <span for="imagePath" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="fathersProfession" class="control-label">Fathers Profession</label>
                                <g:textField class="form-control" id="fathersProfession" tabindex="16"
                                             name="fathersProfession"
                                             placeholder="Enter Fathers Profession."/>
                                <span for="fathersProfession" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="mothersProfession" class="control-label">Mothers Profession</label>
                                <g:textField class="form-control" id="mothersProfession" tabindex="17"
                                             name="mothersProfession"
                                             placeholder="Enter Mothers Profession."/>
                                <span for="mothersProfession" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="fatherAvgIncome" class="control-label">Fathers Average Income</label>

                                <g:textField class="form-control" id="fatherAvgIncome" tabindex="17"
                                             name="fatherAvgIncome"
                                             placeholder="Enter Father AvgIncome."/>
                                <span for="fatherAvgIncome" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="presentAddress" class="control-label">Present Address</label>
                                <g:textArea class="form-control" id="presentAddress" tabindex="14" name="presentAddress"
                                            placeholder="Enter Present Address."/>
                                <span for="presentAddress" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="permanentAddress" class="control-label">Permanent Address</label>
                                <g:textArea class="form-control" id="permanentAddress" tabindex="15"
                                            name="permanentAddress"
                                            placeholder="Enter Permanent Address."/>
                                <span for="presentAddress" class="help-block"></span>
                            </div>
                        </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-8 col-lg-4">
                        <button class="btn btn-primary" tabindex="3" type="submit">Save</button>
                        <button class="btn btn-default" tabindex="4" type="reset">Cancel</button>
                    </div>
                </div>

            </form>
            </div>
        </section>
    </div>
</div>

<r:script>
    $('#datepicker').datepicker({
    format: 'dd/mm/yyyy',
    startDate: '-3d',
    autoclose: true
})

    $('#create-form').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            studentID: {
                required: true,
                minlength: 4,
                maxlength: 15
            },
            email: {
                email:true,
                minlength: 5,
                maxlength: 225
            },
            fatherAvgIncome: {
                number:true
            },
            firstName:{
            required: true
            },
            lastName:{
            required: true
            }
        },
        messages: {
            studentID: {
                required: "Student Id required"
            },
            firstName: {
                required: "Student First Name required"
            },
            lastName: {
                required: "Student Last Name required"
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
            $.ajax({
                url: "${createLink(controller: 'studentDetails', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                     $.growl('Student Details Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
