<div class="row" id="subjectNameCreate" style="display:none">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Advanced Form validations
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal " id="signupForm" method="get" action="">

                        <div class="form-group ">
                            <label for="name" class="control-label col-lg-3">Exam Name.</label>
                            <div class="col-lg-6">
                                <input class=" form-control" id="name" name="name" type="text" />
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="className" class="control-label col-lg-3">Class Name.</label>
                            <div class="col-lg-6">
                                <g:select id="type" name='className' value="${person?.type?.id}" class="form-control m-bot15"
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.settings.ClassName.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="section" class="control-label col-lg-3">Section.</label>
                            <div class="col-lg-6">
                                <g:select id="section" name='section' value="${person?.type?.id}" class="form-control m-bot15"
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.settings.Section.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="examType" class="control-label col-lg-3">Exam Type.</label>
                            <div class="col-lg-6">
                                <g:select id="type" name='examType' value="${person?.type?.id}" class="form-control m-bot15"
                                          noSelection="${['null':'Select One...']}"
                                          from='${com.app.school.settings.ExamType.list()}'
                                          optionKey="id" optionValue="name"></g:select>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="publishedDate" class="control-label col-lg-3">Subject Description.</label>

                            <div class="col-lg-6">
                                <input class=" form-control" id="publishedDate" name="publishedDate" type="text"/>
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="beginingDate" class="control-label col-lg-3">Begaining Date.</label>

                            <div class="col-lg-6">
                                <input class=" form-control" id="beginingDate" name="beginingDate" type="text" class="form-control datepicker" data-date-format="dd/mm/yyyy"/>
                                <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="clearfix">
                                <div class="input-append date input-group" id="dateBegin">
                                    <input type="date" id="beginingDatea" name="beginingDate"
                                           class="form-control datepicker" data-date-format="dd/mm/yyyy"/>
                                    <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
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