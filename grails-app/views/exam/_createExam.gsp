<div class="row" id="examCreate" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Create Class
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="create-form">
                        <g:hiddenField name="id"/>
                        <div class="row">

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="className" class="control-label">* Class Name.</label>
                                <g:select tabindex="1" id="className" name='className' class="form-control"
                                          noSelection="${['':'Select One..']}"
                                          from='${com.app.school.settings.ClassName.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                                <span for="className" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label  for="section" class="control-label">* Section.</label>
                                <g:select tabindex="2" id="section" name='section' class="form-control"
                                          noSelection="${['':'All Section..']}"
                                          from='${com.app.school.settings.Section.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                                <span for="section" class="help-block"></span>
                            </div>
                        </div>

                        <div  class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="examType" class="control-label">* Exam Type.</label>
                                <g:select class=" form-control" id="examType" name='examType' tabindex="3" value=""
                                          noSelection="${['':'Select One..']}"
                                          from='${com.app.school.enums.ExamType.values()}'
                                          optionKey="key" optionValue="value"></g:select>
                                <span for="examType" class="help-block"></span>
                            </div>
                        </div>

                        </div>

                        <div class="row">

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="name" class="control-label">* Exam Name.</label>
                                <input class=" form-control" id="name" name="name" placeholder="Enter Exam Name" tabindex="4" type="text" />
                                <span for="name" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="datepicker" class="control-label">* Begaining Date.</label>
                                <input class=" form-control" id="datepicker" name="startDate" type="text" tabindex="5" placeholder="Enter Begaining Date." class="form-control datepicker"/>
                                <span for="datepicker" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="datepickerA" class="control-label">* End Date.</label>
                                <input class=" form-control" id="datepickerA" name="endDate" type="text" placeholder="Enter End date" tabindex="6" class="form-control datepicker"/>
                                <span for="datepickerA" class="help-block"></span>
                            </div>
                        </div>

                        </div>

                        <div class="row">

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label for="description" class="control-label">Description.</label>
                                <input class=" form-control" id="description" placeholder="Enter Description." name="description" tabindex="7" type="text"/>
                                <span for="description" class="help-block"></span>
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

                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-8 col-lg-4">
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
     $('#datepicker').datepicker({
        format: 'dd/mm/yyyy',
        startDate: '-3d',
        autoclose: true
        })

    $('#datepickerA').datepicker({
        format: 'dd/mm/yyyy',
        startDate: '-3d',
        autoclose: true
        })

    $('#create-form').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            className: {
                required: true
            },
            section:{
            required:true
            },

             examType: {
                required: true
            },
            name: {
                required: true
            },

            startDate: {
                required: true
            },
            endDate: {
                required: true
            }

        },
        messages: {
             className: {
                required: "Class Name required"
            },
            section: {
                required: "Section required"
            },
            examType: {
                required: "Exam Type required"
            },
            name: {
                required: "Exam Name required"
            },
            startDate: {
                required: "Start Date required"
            },
            endDate: {
                required: "End Date required"
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
                url: "${createLink(controller: 'exam', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                    $.growl('Exam Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
