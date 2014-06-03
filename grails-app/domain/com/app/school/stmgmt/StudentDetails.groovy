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
    String imagePath
    Religion religion
    String presentAddress
    String permanentAddress
    String fathersProfession
    String mothersProfession
    Double fatherAvgIncome

    static constraints = {

        fatherAvgIncome nullable: true
        mothersProfession nullable: true
        fathersProfession nullable: true
        permanentAddress nullable: true
        presentAddress nullable: true
        religion nullable: true
        imagePath nullable: true
        cardNo nullable: true
        mobileNo nullable: true
        bloodGroup nullable: true
        birthDate nullable: true
        motherName nullable: true
        fatherName nullable: true
        email nullable: true
        nickName nullable: true

        //System inserted data
        schoolId nullable: true
        createdBy nullable: true
        createdOn nullable: true
        lastUpdatedBy nullable: true
        lastUpdatedOn nullable: true
    }

    static transients = ['fullName']

    //common properties for every table
    String fullName
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

    //common properties for every table
    String getFullName(){

        return this.firstName+" "+this.lastName
    }
}
