package com.school.app.settings
import com.app.school.settings.Exam
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class ExamController {

    def ExamService

    @Secured(['ROLE_SUPER_ADMIN'])
    def index() {
        LinkedHashMap resultMap =ExamService.ExamPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'exam', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'exam', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

    def save(ExamCommand examCommand) {
        if (!request.method == 'POST') {
            //return json message
            return
        }
        if (examCommand.hasErrors()) {
            //return json message
            return
        }
        Exam exam
        if (params.id) { //update Currency
            exam = Exam.get(examCommand.id)
            if (!exam) {
                //return json message
                return
            }
            exam.properties = examCommand.properties
            if (!exam.validate()) {
                //return json message
                return
            }
            exam.save(flush: true)
            //LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
            //flash.message = "Currency Updated successfully"
            //render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
            return
        }
        exam = new Exam(examCommand.properties)
        if (!examCommand.validate()) {
            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
            return
        }
        Exam savedCurr = exam.save(flush: true)
        if (!savedCurr) {
            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
        }

//        LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
//        flash.message = "Currency created successfully"
//        render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
        return

    }

    def delete(Long id) {
        Exam exam = Exam.get(id)
        if (!exam) {
            // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
        exam.save(flush: true)

        def result=[isError:false,message:"Exam deleted g g successfully"]
        String outPut=result as JSON
        render outPut
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =examService.examPaginateList(params)

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

    def update(Long id) {
        Exam exam = Exam.read(id)
        if (!exam) {
            // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
        //  render(template: '/coreBanking/settings/currency/createCurrency', model: [exam: exam])
    }

}

class ExamCommand {
    Long id
    String name
    String description

    static constraints = {
        name nullable: false
    }
}