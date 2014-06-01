package com.school.app.settings
import com.app.school.settings.ExamMark
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPER_ADMIN'])
class ExamMarkController {

    def index() {}
}
