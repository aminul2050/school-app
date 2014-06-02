<%@ page import="com.app.school.settings.ClassName; com.app.school.settings.Subject" %>
<div class="row" id="createClassSubject" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Create Class
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <form class="form-horizontal" id="demoform" action="#" method="post">
                    <div class="form-group">
                        <label for="className" class="col-lg-2 col-sm-2 control-label">Class Name</label>

                        <div class="col-lg-6">
                            <g:select class="form-control input-sm" id="className" name='className' value="${classSubject?.id}"
                                      noSelection="${['null':'Select One...']}"
                                      from='${ClassName.list()}'
                                      optionKey="id" optionValue="name"></g:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="className" class="col-lg-2 col-sm-2 control-label">Class subjects</label>

                        <div class="col-lg-8">
                            <g:select name="classSubjectMap[]"
                                      multiple="multiple"
                                      optionKey="id"
                                      optionValue="subjectName"
                                      from="${subjectList}"
                                      value="${selectedSubjects}" />
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary btn-block">Submit data</button>
                </form>

            </div>
        </section>
    </div>
</div>

<r:script>
        var demo1 = $('[name="classSubjectMap[]"]').bootstrapDualListbox();
        $("#demoform").submit(function(){
        alert($('[name="classSubjectMap[]"]').val());
        return false;
        });
    $('#create-form').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true,
                minlength: 4,
                maxlength: 15
            },
            description: {
                minlength: 5,
                maxlength: 225
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
            $.ajax({
                url: "${createLink(controller: 'className', action: 'save')}",
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                    alert(data.message);
                    clearForm(form);
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
