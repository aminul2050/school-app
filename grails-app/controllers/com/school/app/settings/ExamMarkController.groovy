package com.school.app.settings

import com.app.school.settings.ClassSubject
import com.app.school.settings.Exam
import com.app.school.settings.ExamMark
import com.app.school.settings.Subject
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException
import sun.rmi.runtime.Log

@Secured(['ROLE_SUPER_ADMIN'])
class ExamMarkController {

    def examMarkService
    def subjectService

    def index() {
        LinkedHashMap resultMap = examMarkService.examIniPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'initializeExamMark', model: [dataReturn: null, totalCount: 0])
            return
        }
//        ClassSubject classSubject = ClassSubject.findByClassName(exam.className)
//        def subjectList = subjectService.getSubjects(classSubject.subjectIds)
        int totalCount = resultMap.totalCount
        render(view: 'initializeExamMark', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

    def entry(Long id,Long subjectId){
        Exam exam = Exam.read(id);
        if(!exam){
            redirect(action: 'index')
            return
        }
        Subject subject = Subject.read(subjectId)
        if(!subject){
            redirect(action: 'index')
            return
        }

        LinkedHashMap resultMap = examMarkService.examMarkPaginateList(params,exam,subject)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'examMark', model: [dataReturn: null, totalCount: 0, exam:exam])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'examMark', model: [dataReturn: resultMap.results, totalCount: totalCount, exam:exam])


    }

    def save(ExamMarkCommand examMarkCommand) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (examMarkCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        ExamMark examMark
        if (params.id) { //update Currency
            examMark = ExamMark.get(examMarkCommand.id)
            if (!examMark) {
                result.put('message','Class not found')
                outPut=result as JSON
                render outPut
                return
            }
            examMark.properties = examMarkCommand.properties
            if (!examMark.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            ExamMark savedClass =examMark.save()
            result.put('isError',false)
            result.put('message','Class Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        examMark = new ExamMark(examMarkCommand.properties)
        if (!examMarkCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        ExamMark savedCurr = examMark.save(flush: true)
        if (!savedCurr) {
            result.put('message','Please fill the form correctly')
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
        ExamMark examMark = ExamMark.get(id)
        if(examMark) {
            try {
                println "+++++++++++++++++++++++++"
                examMark.delete(flush:true)
                result.put('isError',false)
                result.put('message',"Class deleted successfully.")
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
        LinkedHashMap resultMap =examMarkService.examMarkPaginateList(params)

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
        ExamMark examMark = ExamMark.read(id)
        if (!examMark) {
            result.put('message','Class name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',examMark)
        outPut = result as JSON
        render outPut
    }

}

class ExamMarkCommand {
    Long id
    String name
    int mark
    String description

    static constraints = {
        name nullable: false
        mark nullable: false
    }
}
