package com.app.school.settings

class Subject {
    transient springSecurityService
    String name
    String description
    Integer ctMark
    Integer hallMark

    static constraints = {
        description(nullable: true)
    }
    //common properties for every table
    Long schoolId
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
