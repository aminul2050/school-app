package com.schoolapp.baily

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPER_ADMIN'])
class HomeController {

    def index() {
        render(view: 'index')
    }
    def calendar() {
        render(view: 'calendar')
    }
    def sync() {
        render(view: 'sync')
    }
    def account() {
        render(view: 'account')
    }
    def dataTable(){
        render(view: 'dataTable')
    }
}
