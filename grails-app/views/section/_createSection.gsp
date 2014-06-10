<%@ page import="com.app.school.settings.ClassName; com.app.school.settings.Section" %>
<div class="row" id="sectionCreate" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Create Section
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="create-form">
                        <g:hiddenField name="id"/>
                        <div class="form-group ">
                        <label for="className" class="control-label col-lg-3">Class Name</label>
                        <div class="col-lg-6">
                            <g:select class="form-control input-sm" id="className" name='className'
                                      noSelection="${['null':'Select One...']}"
                                      from='${ClassName.list()}'
                                      optionKey="id" optionValue="name"></g:select>
                        </div>
                        </div>
                        <div class="form-group ">
                            <label for="name" class="control-label col-lg-3">Section Name</label>
                            <div class="col-lg-6">
                                <g:textField class="form-control" id="name" name="name"/>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="description" class="control-label col-lg-3">Section description</label>
                            <div class="col-lg-6">
                                <g:textField class=" form-control" id="description" name="description"  />
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
            name: {
                required: true,
                maxlength: 15
            },
            description: {
                maxlength: 100
            }
        },
        messages: {
            name: {
                required: "Section Name required"
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
                url: "${createLink(controller: 'section', action: 'save')}",
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
