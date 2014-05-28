package com.app.school.settings

class ClassName {
    transient springSecurityService
    School school
    String name

    static constraints = {
    }

    //common properties for every table
    String createdBy
    Date createdOn
    String lastUpdatedBy
    Date lastUpdatedOn
    def beforeInsert(){
        createdBy = springSecurityService.principal.username
        createdOn = new Date()
    }
    def beforeUpdate() {
        lastUpdatedBy = springSecurityService.principal.username
        lastUpdatedOn = new Date()
    }
    //common properties for every table
}
