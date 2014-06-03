package com.app.school.stmgmt

import com.app.school.enums.Religion

class StudentDetails {

    transient springSecurityService
    String studentID
    String firstName
    String lastName
    String nickName
    String fatherName
    String motherName
    Date birthDate
    String bloodGroup
    String email
    String mobileNo
    String cardNo
    Date entryDate
    String imagePath
    Enum  religion
    String presentAddress
    String permanentAddress
    String fathersProfession
    String mothersProfession
    Double fatherAvgIncome

    static constraints = {

        nickName nullable: true
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
