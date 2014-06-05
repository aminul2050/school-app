package com.app.school.stmgmt

import com.app.school.enums.AdmissionType
import com.app.school.enums.Religion
import com.app.school.settings.ClassName
import com.app.school.settings.Section

class Student {
    transient springSecurityService

    ClassName className
    Section section
    int academicYear
    StudentDetails details
    String studentName
    String studentNo
    Date admissionDate
    AdmissionType admissionType

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