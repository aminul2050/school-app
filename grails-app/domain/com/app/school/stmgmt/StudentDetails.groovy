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
    PersonalInfo personalInfo
    String email
    String mobileNo
    String cardNo
    Date entryDate
    String imagePath

    static constraints = {

//            studentID(nullable: true)
//            name(blank: false, nullable: false)
//            stuFatherName(blank: false, nullable: false)
//            stuMotherName(nullable: true)
//            stuReligion(nullable: true)
//            stuStreetPAddress(nullable: true)
//            stuCStreetAddress(nullable: true)
//            stuPhone(nullable: true)
//            stuEmail(nullable: true, email: true)
//            immMob(nullable: true)
//            fatherProfession(nullable: true)
//            motherProfession(nullable: true)
//            fatherAvgIncome(nullable: true)
//            cardNo(nullable: true)
//            stuEntryDate(nullable: true)
//            stdBirthDate(nullable: true)
//            imagePath(nullable: true)
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
