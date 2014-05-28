package com.app.school.settings

import com.app.school.stmgmt.AdmissionInfo

class ExamMark {
    transient springSecurityService
    Exam exam
    AdmissionInfo admission
    Subject subject
    int mark
    String grade

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
