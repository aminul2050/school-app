package com.app.school.settings

import com.app.school.enums.ExamStatus
import com.app.school.enums.ExamType

class Exam {
    transient springSecurityService

    String name
    String description
    Date startDate
    Date endDate
    Date publishedDate
    ExamStatus examStatus = ExamStatus.MARKENTRY
    ClassName className
    Section section
    ExamType examType
    String examSubjectIds
    String notCompletedYet

    //common properties for every table
    static constraints = {
        endDate(nullable: true)
        publishedDate(nullable: true)
        description(nullable: true)
        section nullable: true
        notCompletedYet nullable: true
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
