package com.app.school.stmgmt

import com.app.school.settings.ClassName
import com.app.school.settings.Section

class AdmissionInfo {
    transient springSecurityService

    ClassName className
    Student student
    String studentNo
    Date admissionDate
    String academicYear
    Section section



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
