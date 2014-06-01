<%@ page import="com.app.school.settings.Subject" %>
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
                <form id="demoform" action="#" method="post">
                    <g:select name="duallistbox_demo1[]"
                              multiple="multiple"
                              optionKey="id"
                              optionValue="name"
                              from="${Subject.list()}"
                              value="${Subject.list()}" />

                    <br>
                    <button type="submit" class="btn btn-primary btn-block">Submit data</button>
                </form>

            </div>
        </section>
    </div>
</div>

<r:script>
        var demo1 = $('[name="duallistbox_demo1[]"]').bootstrapDualListbox();
        $("#demoform").submit(function(){
        alert($('[name="duallistbox_demo1[]"]').val());
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
