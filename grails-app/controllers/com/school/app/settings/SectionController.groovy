package com.school.app.settings

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPER_ADMIN'])
class SectionController {

    def index() {}
}
