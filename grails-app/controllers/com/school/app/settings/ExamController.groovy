package com.school.app.settings

import com.app.school.enums.ExamStatus
import com.app.school.enums.ExamType
import com.app.school.settings.ClassName
import com.app.school.settings.Exam
import com.app.school.settings.Section
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class ExamController {

    def examService

    def index() {
        LinkedHashMap resultMap =examService.ExamPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'exam', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'exam', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

//    def save(ExamCommand examCommand) {
//
//        print("Params-----------"+params)
//        if (!request.method == 'POST') {
//            //return json message
//            return
//        }
//        LinkedHashMap result = new LinkedHashMap()
//        result.put('isError',true)
//        String outPut
//        if (examCommand.hasErrors()) {
//            //return json message
//            return
//        }
//        Exam exam
//        if (params.id) { //update Currency
//            exam = Exam.get(examCommand.id)
//            if (!exam) {
//                result.put('message','Please fill the form correctly')
//                outPut=result as JSON
//                render outPut
//                return
//            }
//            exam.properties = examCommand.properties
//            if (!exam.validate()) {
//                result.put('message','Please fill the form correctly')
//                outPut=result as JSON
//                render outPut
//                return
//            }
//            exam.save(flush: true)
//            //LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
//            //flash.message = "Currency Updated successfully"
//            //render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
//            return
//        }
//        exam = new Exam(examCommand.properties)
//        if (!examCommand.validate()) {
//            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
//            return
//        }
//        Exam savedCurr = exam.save(flush: true)
//        if (!savedCurr) {
//            result.put('message','Please fill the form correctly')
//            outPut=result as JSON
//            render outPut
//            return
//        }
//        result.put('isError',false)
//        result.put('message','exam updated successfully')
//        outPut=result as JSON
//        render outPut
//    }


    def save(ExamCommand examCommand) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (examCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Exam exam
        if (params.id) { //update Currency
            exam = Exam.get(examCommand.id)
            if (!exam) {
                result.put('message','Exam not found')
                outPut=result as JSON
                render outPut
                return
            }
            exam.properties = examCommand.properties
            if (!exam.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            Exam savedClass =exam.save()
            result.put('isError',false)
            result.put('message','Exam Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }

        exam = new Exam(examCommand.properties)
        exam.examStatus=ExamStatus.MARKENTRY
        if (!examCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }

        Exam savedCurr = exam.save(flush: true)
        if (!savedCurr) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('message','Exam updated successfully')
        outPut=result as JSON
        render outPut

    }



    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        Exam exam= Exam.get(id)
        if(exam) {
            try {
                println "+++++++++++++++++++++++++"
                exam.delete(flush:true)
                result.put('isError',false)
                result.put('message',"Exam deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch(DataIntegrityViolationException e) {
                result.put('isError',true)
                result.put('message',"Exam could not deleted. Already in use.")
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
        LinkedHashMap resultMap =examService.ExamPaginateList(params)

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
        Exam exam = Exam.read(id)
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (!exam) {
            result.put('message','Exam  not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',exam)
        outPut = result as JSON
        render outPut
    }

}

class ExamCommand {
    Long id
    String name
    String description
    Date startDate
    Date endDate
    Date publishedDate
    ClassName className
    Section section
    ExamType examType

    static constraints = {
        name nullable: true
    }
}