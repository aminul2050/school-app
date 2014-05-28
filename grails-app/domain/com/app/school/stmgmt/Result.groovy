package com.app.school.stmgmt

import com.app.school.settings.Exam

class Result {
    transient springSecurityService
    Exam exam
    Student student
    Float gradePoint
    String gpa
    Float grandTotal
    Float highestMark
    String positionInSection
    String positionInClass

    static constraints = {
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
