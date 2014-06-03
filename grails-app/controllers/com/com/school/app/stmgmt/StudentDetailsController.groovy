package com.com.school.app.stmgmt

import com.app.school.enums.Religion
import com.app.school.stmgmt.StudentDetails
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class StudentDetailsController {

    def studentDetailsService

    def index() {
        LinkedHashMap resultMap = studentDetailsService.studentDetailsPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'studentDetails', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'studentDetails', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

    def save(StudentDetailsCommand studentDetailsCommand) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (studentDetailsCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        StudentDetails studentDetails
        if (params.id) { //update Currency
            studentDetails = StudentDetails.get(studentDetailsCommand.id)
            if (!studentDetails) {
                result.put('message','Student not found')
                outPut=result as JSON
                render outPut
                return
            }
            studentDetails.properties = studentDetailsCommand.properties
            if (!studentDetails.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            StudentDetails savedClass =studentDetails.save()
            result.put('isError',false)
            result.put('message','Student Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        studentDetails = new StudentDetails(studentDetailsCommand.properties)
        if (!studentDetailsCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        StudentDetails savedCurr = studentDetails.save(flush: true)
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

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        StudentDetails studentDetails = StudentDetails.get(id)
        if(studentDetails) {
            try {
                studentDetails.delete(flush:true)
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
        result.put('message',"Class not found")
        outPut = result as JSON
        render outPut
        return
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =studentDetailsService.studentDetailsPaginateList(params)

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
        StudentDetails studentDetails = StudentDetails.read(id)
        if (!studentDetails) {
            result.put('message','Class name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',studentDetails)
        outPut = result as JSON
        render outPut
    }

}

class StudentDetailsCommand {
    Long id
    String studentID
    String firstName
    String lastName
    String nickName
    String fatherName
    String motherName
    Date birthDate
    String bloodGroup
    String email
    String mobileNo
    String cardNo
    String imagePath
    Religion religion
    String presentAddress
    String permanentAddress
    String fathersProfession
    String mothersProfession
    Double fatherAvgIncome

    static constraints = {
        studentID nullable: false
        firstName nullable: false
        lastName nullable: false
    }
}
