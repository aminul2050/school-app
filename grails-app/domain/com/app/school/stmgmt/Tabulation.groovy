package com.app.school.stmgmt

import com.app.school.settings.Exam

class Tabulation {
    def springSecurityService
    Exam exam
//    Student student
    String studentId
    String studentName

    //common subjects
    Integer subject1Mark
//    String subject1Grade
//    Integer subject1Gpa

    Integer subject2Mark
//    String subject2Grade
//    Integer subject2Gpa

    Integer subject3Mark
//    Integer subject3Gpa

    Integer subject4Mark
//    Integer subject4Gpa

    Integer subject5Mark
//    Integer subject5Gpa

    Integer subject6Mark
//    Integer subject6Gpa

    Double grandTotal
    String positionInSection
    String positionInClass


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
