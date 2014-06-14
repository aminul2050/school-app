<div class="row" id="examMarkCreate" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                <span class="label label-default">Class:</span>
                <span class="label label-primary">${exam.className.name}</span>
                <span class="label label-default">Section:</span>
                <span class="label label-primary">${exam.section.name}</span>
                <span class="label label-default">Exam:</span>
                <span class="label label-primary">${exam.name}</span>
                <span class="label label-default">Subject</span>
                <span class="label label-primary">name</span>
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="create-form">
                        <g:hiddenField name="id"/>
                        <div class="form-group ">
                            <label for="student" class="control-label col-lg-3">Student Name</label>
                            <div class="col-lg-6">
                                %{--<g:textField class="form-control" id="details" name="details"/>--}%
                                <g:select id="student" class="populate form-control" name='student'
                                          noSelection="${['': 'Select One...']}"
                                          from='${studentList}'
                                          optionKey="id" optionValue="studentName"></g:select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="Mark" class="control-label col-lg-3">Mark </label>
                            <div class="col-lg-6">
                                <g:textField class="form-control" id="mark" name="mark"/>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="description" class="control-label col-lg-3">Comments</label>
                            <div class="col-lg-6">
                                <input class=" form-control" id="description" name="description" type="text" />
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
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            student: {
                required: true
            },
             mark: {
                required: true,
                digits: true,
                min:0,
                max:100
            },
            description: {
                minlength: 0,
                maxlength: 225
            }
        },
        messages: {
            name: {
                required: "Class Name required"
            },
             mark: {
                required: "Mark required"
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
                url: "${createLink(controller: 'examMark', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    clearForm(form);
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                     $.growl('Exam Mark Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
