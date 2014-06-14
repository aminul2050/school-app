package com.app.school.stmgmt

import com.app.school.enums.AdmissionType
import com.app.school.settings.ClassName
import com.app.school.settings.Section

class Student {
    transient springSecurityService

    ClassName className
    Section section
    int academicYear
    String subjectIds
    StudentDetails details
    String studentName
    String studentNo
    Integer rollNumber
    Date admissionDate
    AdmissionType admissionType

    static constraints = {

        //System inserted data
        schoolId nullable: true
        createdBy nullable: true
        createdOn nullable: true
        lastUpdatedBy nullable: true
        lastUpdatedOn nullable: true
    }

    //common properties for every table
    Long schoolId
    String createdBy
    Date createdOn
    String lastUpdatedBy
    Date lastUpdatedOn
    def beforeInsert(){
        schoolId=10000
        createdBy = springSecurityService?.principal? springSecurityService.principal.username:'SystemUser'
        createdOn = new Date()
    }
    def beforeUpdate() {
        lastUpdatedBy = springSecurityService?.principal? springSecurityService.principal.username:'SystemUser'
        lastUpdatedOn = new Date()
    }
    //common properties for every table
}
