package com.school.app.settings

import com.app.school.settings.ClassName
import com.app.school.settings.ClassSubject
import com.app.school.settings.Exam
import com.app.school.settings.ExamMark
import com.app.school.settings.Section
import com.app.school.settings.Subject
import com.app.school.stmgmt.Student
import com.school.app.CommonUtils
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import org.springframework.dao.DataIntegrityViolationException
import sun.rmi.runtime.Log

@Secured(['ROLE_SUPER_ADMIN'])
class ExamMarkController {

    def examMarkService
    def subjectService
    def jasperService

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
        def studentList
        if(exam.section){
            studentList = Student.findBySchoolIdAndClassNameAndSection(CommonUtils.DEFAULT_SCHOOL_ID, exam.className,exam.section)
        }else {
           studentList = Student.findBySchoolIdAndClassName(CommonUtils.DEFAULT_SCHOOL_ID,exam.className)
        }
        LinkedHashMap resultMap = examMarkService.examMarkPaginateList(params,exam,subject)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'examMark', model: [dataReturn: null, totalCount: 0, exam:exam,subject:subject, studentList:studentList])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'examMark', model: [dataReturn: resultMap.results, totalCount: totalCount,exam:exam,subject:subject, studentList:studentList])


    }

    def save(ExamMarkCommand examMarkCommand) {

        print("params------------"+params)
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
    def markComplete(Long id, Long subjectId){
        Exam exam = Exam.get(id)
        if(!exam){
            redirect(action: 'index')
            return
        }
        Subject subject = Subject.read(subjectId)
        if(!subject){
            redirect(action: 'index')
            return
        }

        exam.notCompletedYet = CommonUtils.handleMarkComplete(exam.notCompletedYet, subject.id.toString())
        exam.save()
        redirect(action: 'index')
    }
    def download(Long id, Long subjectId, String exportFormat){
        /*Exam exam = Exam.read(id)
        if(!exam){
            redirect(action: 'index')
            return
        }*/
        //check export format is valid [pdf, excel,csv]
        Map reportMap = new LinkedHashMap()
        reportMap.put("examId","1")
        reportMap.put("sectionId","1")
        reportMap.put("subjectId","1")

        File reportFolder = ApplicationHolder.application.parentContext.getResource("/reports").file;
        String reportDir = reportFolder.absolutePath;
        println "reportDir " + reportDir
        JasperReportDef reportDef = new JasperReportDef(name: 'sample-jasper-plugin.jrxml', fileFormat: JasperExportFormat.PDF_FORMAT,
                parameters: reportMap, folder: reportDir)
        ByteArrayOutputStream report = jasperService.generateReport(reportDef) // generate report

        response.contentType = 'pdf' /*ConfigurationHolder.config.grails.mime.types[REPORT_FILE_FORMAT]*/
        response.setHeader("Content-disposition", "inline;filename=subjectNumbers.pdf")
        response.outputStream << report.toByteArray()
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

    def list(Long examId, Long subjectId) {
        Exam exam = Exam.read(examId)
        Subject subject = Subject.read(subjectId)

        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =examMarkService.examMarkPaginateList(params, exam, subject)

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
    Exam exam
    Student student
    Subject subject
    int mark
    String description

    static constraints = {
        exam nullable: false
        subject nullable: false
        student nullable: false
        mark nullable: false
    }
}
