package com.school.app.settings

import com.app.school.settings.ClassName
import com.app.school.settings.ClassSubject
import com.app.school.settings.Subject
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class ClassSubjectController {
    def classSubjectService
    def subjectService

    def index() {
        LinkedHashMap resultMap = classSubjectService.classSubjectPaginateList(params)
        def subjectList = Subject.list()
        def selectedSubjects = null //subjectService.getSubjects('2,3')

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'classSubject', model: [dataReturn: null, totalCount: 0,subjectList:subjectList,selectedSubjects:selectedSubjects])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'classSubject', model: [dataReturn: resultMap.results, totalCount: totalCount,subjectList:subjectList,selectedSubjects:selectedSubjects])
    }

    def save(ClassSubjectCommand classSubjectCommand) {
        println params
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (classSubjectCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }

        ClassSubject classSubject
        if (params.id) { //update Currency
            classSubject = ClassSubject.get(classSubjectCommand.id)
            if (!classSubject) {
                result.put('message','Class not found')
                outPut=result as JSON
                render outPut
                return
            }
            classSubject.properties = classSubjectCommand.properties
            if (!classSubject.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            ClassSubject savedClass =classSubject.save()
            result.put('isError',false)
            result.put('message','Class Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        classSubject = new ClassSubject(classSubjectCommand.properties)
        if (!classSubjectCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        ClassSubject savedCurr = classSubject.save(flush: true)
        if (!savedCurr) {
            result.put('isError',true)
            result.put('message','Class mapping already exist')
            outPut=result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('message','Class updated successfully')
        outPut=result as JSON
        render outPut

    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        ClassSubject classSubject = ClassSubject.get(id)
        if(classSubject) {
            try {
                println "+++++++++++++++++++++++++"
                classSubject.delete(flush:true)
                result.put('isError',false)
                result.put('message',"Mapping deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch(DataIntegrityViolationException e) {
                result.put('isError',true)
                result.put('message',"Class could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError',true)
        result.put('message',"Class not found")
        outPut = result as JSON
        render outPut
        return
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =classSubjectService.classSubjectPaginateList(params)

        if(!resultMap || resultMap.totalCount== 0){
            gridData = [iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: null]
            result = gridData as JSON
            render result
            return
        }
        int totalCount =resultMap.totalCount
        gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: resultMap.results]
        result = gridData as JSON
        render result

    }

    def edit(Long id) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        ClassSubject classSubject = ClassSubject.read(id)
        if (!classSubject) {
            result.put('message','No mapping found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',classSubject)
        outPut = result as JSON
        render outPut
    }

}

class ClassSubjectCommand {
    Long id
    ClassName className
    String subjectIds

    static constraints = {
//        subjectIds nullable: false
    }
}
