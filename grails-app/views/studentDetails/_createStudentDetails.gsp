<div class="row" id="createStudentDetails" style="display:none">
    <div class="col-md-15">
        <section class="panel">
            <header class="panel-heading">
                Create Student
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>

            <div class="panel-body">
                <div class="form">

                    <form class="cmxform form-horizontal " id="create-form">

                        <g:hiddenField name="id"/>

                        <div class="col-md-6">

                        <div class="form-group ">
                            <label for="studentID" class="control-label col-md-5">Student ID</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="studentID" name="studentID" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="firstName" class="control-label col-md-5">First Name</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="firstName" name="firstName" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="lastName" class="control-label col-md-5">Last Name</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="lastName" name="lastName" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="nickName" class="control-label col-md-5">Nic Name</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="nickName" name="nickName" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="fatherName" class="control-label col-md-5">Fathers Name</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="fatherName" name="fatherName" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="motherName" class="control-label col-md-5">Mothers Name</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="motherName" name="motherName" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="birthDate" class="control-label col-md-5">Birth Date</label>

                            <div class="col-md-7">
                                <input type="date" id="birthDate" name="birthDate"
                                       class="form-control datepicker" data-date-format="dd/mm/yyyy"/>
                            </div>
                        </div>



                        <div class="form-group ">
                            <label for="bloodGroup" class="control-label col-md-5">Blood Group</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="bloodGroup" name="bloodGroup" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="email" class="control-label col-md-5">Email</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="email" name="email" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="mobileNo" class="control-label col-md-5">Fathers Name</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="mobileNo" name="mobileNo" type="text"/>
                            </div>
                        </div>

                    </div>

                        <div class="col-md-6">

                        <div class="form-group ">
                            <label for="cardNo" class="control-label col-md-5">Card Number</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="cardNo" name="cardNo" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="imagePath" class="control-label col-md-5">Image Path</label>

                            <div class="col-md-7">
                                <input type="file" id="imagePath"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="religion" class="control-label col-md-5">Relegion</label>

                            <div class="col-md-7">
                                <g:select id="religion" name='type.id' value=""
                                          noSelection="${['null': 'Select One...']}"
                                          from=''
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="presentAddress" class="control-label col-md-5">Present Address</label>

                            <div class="col-md-7">
                                <textarea class=" form-control" id="presentAddress" name="presentAddress"></textarea>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="permanentAddress" class="control-label col-md-5">Permanent Address</label>

                            <div class="col-md-7">
                                <textarea class=" form-control" id="permanentAddress"
                                          name="permanentAddress"></textarea>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="fathersProfession" class="control-label col-md-5">Fathers Profession</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="fathersProfession" name="fathersProfession"
                                       type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="mothersProfession" class="control-label col-md-5">Mothers Profession</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="mothersProfession" name="mothersProfession"
                                       type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="fatherAvgIncome" class="control-label col-md-5">Fathers Average Income</label>

                            <div class="col-md-7">
                                <input class=" form-control" id="fatherAvgIncome" name="fatherAvgIncome" type="text"/>
                            </div>
                        </div>

                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-6">
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
        errorStudent: 'help-block',
        focusInvalid: false,
        rules: {
            studentID: {
                required: true,
                minlength: 5,
                maxlength: 15
            },
            firstName: {
                minlength: 5,
                maxlength: 555
            }
        },
        messages: {
            studentID: {
                required: "Student ID required"
            }
        },
        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('#currencyForm')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeStudent('has-info').addStudent('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeStudent('has-error').addStudent('has-info');
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
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
