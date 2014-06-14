package com.app.school.settings

class Subject {
    transient springSecurityService
    String name
    String description
    Integer ctMark
    Integer hallMark
    Boolean isOptional =false

    static constraints = {
        name nullable: false, unique: true
        description nullable: true

        //System inserted data
        schoolId nullable: true
        createdBy nullable: true
        createdOn nullable: true
        lastUpdatedBy nullable: true
        lastUpdatedOn nullable: true
    }
    static transients = ['subjectName']

    //common properties for every table
    String subjectName
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
    String getSubjectName(){
        if(this.isOptional){
            return this.name+" (Optional)"
        }
        return this.name
    }
}
