package com.app.school.settings

import com.app.school.stmgmt.Student


class ExamMark {
    transient springSecurityService
    Exam exam
    Student student
    Subject subject
    int mark
    int gpa
    String grade
    String description

    static constraints = {
        description nullable: true
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
    def beforeValidate() {
        if(this.mark>=90){
            this.gpa=5;
            this.grade='A+'
        }else if(this.mark>=80 && this.mark<90){
            this.gpa=4
            this.grade='A'
        }else if(this.mark>=70 && this.mark<80){
            this.gpa=3
            this.grade='A-'
        }else if(this.mark>=60 && this.mark<70){
            this.gpa=2
            this.grade='B'
        }else if(this.mark>=50 && this.mark<60){
            this.gpa=1
            this.grade='C'
        }else {
            this.gpa=0
            this.grade='F'
        }
    }
}
