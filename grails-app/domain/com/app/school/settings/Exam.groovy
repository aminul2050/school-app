package com.app.school.settings

import com.app.school.enums.ExamStatus
import com.app.school.enums.ExamType

class Exam {
    transient springSecurityService

    String name
    Date startDate
    Date endDate
    Date publishedDate
    ExamStatus examStatus = ExamStatus.MARKENTRY
    ClassName className
    Section section
    ExamType examType

    static constraints = {
        name(unique: true)
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
