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
                        <div class="form-group ">
                            <label for="className" class="control-label col-lg-3">Class Name.</label>
                            <div class="col-lg-6">
                                <g:select id="type" name='className' class="form-control m-bot15"
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.settings.ClassName.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="section" class="control-label col-lg-3">Section.</label>
                            <div class="col-lg-6">
                                <g:select id="section" name='section' class="form-control m-bot15"
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.settings.Section.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="examType" class="control-label col-lg-3">Exam Type.</label>
                            <div class="col-lg-6">
                                <g:select class=" form-control" id="type" name='examType' value=""
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.enums.ExamType.values()}'
                                          optionKey="key" optionValue="value"></g:select>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="name" class="control-label col-lg-3">Exam Name.</label>
                            <div class="col-lg-6">
                                <input class=" form-control" id="name" name="name" type="text" />
                            </div>
                        </div>



                        <div class="form-group ">
                            <label for="description" class="control-label col-lg-3">Description.</label>

                            <div class="col-lg-6">
                                <input class=" form-control" id="description" name="description" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="datepicker" class="control-label col-lg-3">Begaining Date.</label>

                            <div class="col-lg-6">
                                <input class=" form-control" id="datepicker" name="startDate" type="text" class="form-control datepicker"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="datepickerA" class="control-label col-lg-3">End Date.</label>
                            <div class="col-lg-6">
                                <input class=" form-control" id="datepickerA" name="endDate" type="text" class="form-control datepicker"/>
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
            name: {
                required: true,
                minlength: 0,
                maxlength: 200
            },
            description: {
                minlength: 0,
                maxlength: 200
            }
        },
        messages: {
            name: {
                required: "Exam Name required"
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
