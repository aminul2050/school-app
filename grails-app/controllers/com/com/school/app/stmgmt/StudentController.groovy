package com.com.school.app.stmgmt

import com.app.school.settings.Section
import com.app.school.stmgmt.Student
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class StudentController {

    def studentService

    def index() {

        LinkedHashMap resultMap = studentService.sectionPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'examInitialize', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'examInitialize', model: [dataReturn: resultMap.results, totalCount: totalCount])

    }

    def save(StudentCommand studentCommand) {
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

        LinkedHashMap resultMap = studentService.studentPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'student', model: [dataReturn: null, totalCount: 0, section:section])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'student', model: [dataReturn: resultMap.results, totalCount: totalCount, section:section])
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

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =studentService.studentPaginateList(params)

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

}

class StudentCommand {
    Long id
    String name
    String description

    static constraints = {
        name nullable: false
    }
}