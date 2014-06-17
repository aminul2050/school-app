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

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label class="control-label" for="className">Class Name</label>
                            <g:select class="form-control input-sm" id="className" name='className' tabindex="1"
                                      noSelection="${['':'Select One...']}"
                                      from='${ClassName.list()}'
                                      optionKey="id" optionValue="name"></g:select>
                                <span for="className" class="help-block"></span>
                        </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label class="control-label" for="name">Section Name</label>
                                <g:textField class="form-control" id="name" name="name" placeholder="Enter Section Name" tabindex="2"/>
                                <span for="name" class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <div class="col-md-12">
                                <label class="control-label" for="name">Description</label>
                                <g:textField class=" form-control" id="description" name="description" placeholder="Enter Description" tabindex="3" />
                                <span for="description" class="help-block"></span>
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
            </div>

        </section>
    </div>
</div>

<r:script>
    $('#create-form').validate({
        errorElement: 'span',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            name: {
                required: true,
                maxlength: 25
            },
            className: {
              required: true
            }
        },
        messages: {
            name: {
             required: "Section Name required"
            },
             className: {
                required: "Class Name is required"
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
//                    $('#className').val('');
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                     $.growl('Section Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
