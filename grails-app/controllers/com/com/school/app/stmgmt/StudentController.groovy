package com.com.school.app.stmgmt

import com.app.school.enums.AdmissionType
import com.app.school.settings.ClassName
import com.app.school.settings.ClassSubject
import com.app.school.settings.Section
import com.app.school.stmgmt.Student
import com.app.school.stmgmt.StudentDetails
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class StudentController {

    def studentService
    def subjectService

    def index() {

        LinkedHashMap resultMap = studentService.sectionPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'studentInitialize', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'studentInitialize', model: [dataReturn: resultMap.results, totalCount: totalCount])

    }

    def save(StudentCommand studentCommand) {

        println(params)
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (studentCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Student student
        if (params.id) { //update Currency
            student = Student.get(studentCommand.id)
            if (!student) {
                result.put('message','Student not found')
                outPut=result as JSON
                render outPut
                return
            }
            student.properties = studentCommand.properties
            student.studentName=student.details.fullName
            if (!student.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            Student savedStudent =student.save()
            result.put('isError',false)
            result.put('message','Student Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        student = new Student(studentCommand.properties)
        student.studentName=studentCommand.details.fullName
        if (!studentCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Student savedCurr = student.save(flush: true)
        if (!savedCurr) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('message','Student updated successfully')
        outPut=result as JSON
        render outPut
    }

    def admission(Long id, String type){
        Section section = Section.read(id)
        if(!section){
            redirect(action: 'index')
            return
        }
        ClassName className = section.className
        ClassSubject classSubject = ClassSubject.findByClassName(className)
        def optionalSubjects = subjectService.getOptionalSubjects(classSubject.subjectIds)

        LinkedHashMap resultMap = studentService.studentPaginateList(params,className,section)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'student', model: [dataReturn: null, totalCount: 0,className:className, section:section,optionalSubjects:optionalSubjects])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'student', model: [dataReturn: resultMap.results, totalCount: totalCount, className:className, section:section,optionalSubjects:optionalSubjects])
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        Student student = Student.get(id)
        if(student) {
            try {
                student.delete(flush:true)
                result.put('isError',false)
                result.put('message',"Student deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch(DataIntegrityViolationException e) {
                result.put('isError',true)
                result.put('message',"Student could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError',true)
        result.put('message',"Student not found")
        outPut = result as JSON
        render outPut
        return
    }

    def list(Long classId, Long sectionId) {
        ClassName className = ClassName.read(classId)
        Section section = Section.read(sectionId)
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =studentService.studentPaginateList(params,className,section)

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
        Student student = Student.read(id)
        if (!student) {
            result.put('message','Student name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',student)
        outPut = result as JSON
        render outPut
    }

    def ajaxFindStudentId() {
//        def c = com.baily.student.StudentInfo.createCriteria()
        def c = com.app.school.stmgmt.StudentDetails.createCriteria()
//        def studentId = com.baily.academic.setup.Admission.findAll().studentInfo.studentID

//        if (studentId.size() == 0) {
//            def foundStudent = c.list {
//                ilike 'studentID', '%' + params.term + '%'
//            }
//            render(foundStudent?.'studentID' as JSON)
//        } else {
            def foundStudent = c.list {
                ilike 'studentID', '%' + params.term + '%'
                and {
                    not {
                        'in'('studentID', studentId)
                    }
                }
            }
            render(foundStudent?.'studentID' as JSON)
        }
//    }


}

class StudentCommand {
    Long id
    ClassName className
    Section section
    int academicYear
    Integer rollNumber
    String subjectIds
    StudentDetails details
    Date admissionDate

    static constraints = {

    }
}