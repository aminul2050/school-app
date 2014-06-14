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
                                <label for="studentID" class="control-label4">* Student ID</label>
                                <g:textField class="form-control" id="studentID" tabindex="1" name="studentID" placeholder="Enter Student Name."/>
                                <span for="studentID" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="firstName" class="control-label">First Name *</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="firstName" name="firstName" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="lastName" class="control-label col-md-4">Last Name *</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="lastName" name="lastName" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="nickName" class="control-label col-md-4">Nic Name</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="nickName" name="nickName" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="fatherName" class="control-label col-md-4">Fathers Name</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="fatherName" name="fatherName" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="motherName" class="control-label col-md-4">Mothers Name</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="motherName" name="motherName" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="datepicker" class="control-label col-md-4">Birth Date</label>

                                <div class="col-md-8">
                                    <input type="date" id="datepicker" name="birthDate" class="form-control datepicker"/>
                                </div>
                            </div>



                            <div class="form-group ">
                                <label for="bloodGroup" class="control-label col-md-4">Blood Group</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="bloodGroup" name="bloodGroup" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="email" class="control-label col-md-4">Email</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="email" name="email" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="mobileNo" class="control-label col-md-4">Contact Number</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="mobileNo" name="mobileNo" type="text"/>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <div class="form-group ">
                                <label for="cardNo" class="control-label col-md-4">Card Number</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="cardNo" name="cardNo" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="imagePath" class="control-label col-md-4">Image Path</label>

                                <div class="col-md-8">
                                    <input class=" form-control" type="file" id="imagePath"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="religion" class="control-label col-md-4">Religion</label>

                                <div class="col-md-8">
                                    <g:select class=" form-control" id="religion" name='religion'
                                              noSelection="${['':'Select One...']}"
                                              from='${com.app.school.enums.Religion.values()}'
                                              optionKey="key" optionValue="value"></g:select>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="presentAddress" class="control-label col-md-4">Present Address</label>

                                <div class="col-md-8">
                                    <textarea class=" form-control" id="presentAddress" name="presentAddress"></textarea>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="permanentAddress" class="control-label col-md-4">Permanent Address</label>

                                <div class="col-md-8">
                                    <textarea class=" form-control" id="permanentAddress"
                                              name="permanentAddress"></textarea>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="fathersProfession" class="control-label col-md-4">Fathers Profession</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="fathersProfession" name="fathersProfession"
                                           type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="mothersProfession" class="control-label col-md-4">Mothers Profession</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="mothersProfession" name="mothersProfession"
                                           type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="fatherAvgIncome" class="control-label col-md-4">Fathers Average Income</label>

                                <div class="col-md-8">
                                    <input class=" form-control" id="fatherAvgIncome" name="fatherAvgIncome" type="text"/>
                                </div>
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
