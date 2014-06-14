<%@ page import="com.app.school.settings.ClassName; com.app.school.settings.Subject" %>
<div class="row" id="createClassSubject" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Map Subject with Class
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <form class="cmxform form-horizontal " id="create-form">
                    <g:hiddenField name="id"/>
                    <div class="form-group">
                        <label for="className" class="col-lg-2 col-sm-2 control-label">Class Name</label>

                        <div class="col-lg-6">
                            <g:select class="form-control input-sm" id="className" name='className' value="${classSubject?.id}"
                                      noSelection="${['':'Select One...']}"
                                      from='${ClassName.list()}'
                                      optionKey="id" optionValue="name"></g:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="classSubjectMapping" class="col-lg-2 col-sm-2 control-label">Class subjects</label>

                        <div class="col-lg-8">
                            <g:select name="classSubjectMap[]" id="classSubjectMapping"
                                      multiple="multiple"
                                      optionKey="id"
                                      optionValue="subjectName"
                                      from="${subjectList}"/>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-6">
                            <button class="btn btn-primary" type="submit">Save</button>
                            <button class="btn btn-default" type="button">Cancel</button>
                        </div>
                    </div>
                </form>

            </div>
        </section>
    </div>
</div>

<r:script>
        $('#classSubjectMapping').multiSelect();
//        var demo1 = $('[name="classSubjectMap[]"]').bootstrapDualListbox();
    $('#create-form').validate({
        errorElement: 'small',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            className: {
                required: true
            }
        },
        messages: {
            className: {
                required: "Class Subject required"
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
        var subjectIds = $('[name="classSubjectMap[]"]').val();
        if(subjectIds==undefined || subjectIds ==null){
        alert("Plese map subject with class");
        return false;
        }
            $.ajax({
                url: "${createLink(controller: 'classSubject', action: 'save')}?subjectIds="+subjectIds,
                type: 'post',
                dataType: "json",
                data: $("#create-form").serialize(),
                success: function (data) {
                if(data.isError){
                alert(data.message);
                return false;
                }
                    clearForm(form);
                    $('#classSubjectMapping').multiSelect('deselect_all');
                    $('#classSubjectMapping').multiSelect('refresh');
                    var table = $('#list-table').DataTable();
                    table.ajax.reload();
                     $.growl('Class Subject Created successfully!', { type: 'success' });
                },
                failure: function (data) {
                }
            })
        }
    });
</r:script>
