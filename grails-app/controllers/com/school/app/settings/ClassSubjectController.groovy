package com.school.app.settings

import com.app.school.settings.ClassSubject
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPER_ADMIN'])
class ClassSubjectController {
    def ClassSubjectService

    def index() {
        LinkedHashMap resultMap = null//ClassSubjectService.ClassSubjectPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'classSubject', model: [dataReturn: null, totalCount: 0])
            return
        }
        /*int totalCount = resultMap.totalCount
        render(view: 'classSubject', model: [dataReturn: resultMap.results, totalCount: totalCount])*/
    }

    def save(ClassSubjectCommand classSubjectCommand) {
        if (!request.method == 'POST') {
            //return json message
            return
        }
        if (classSubjectCommand.hasErrors()) {
            //return json message
            return
        }
        ClassSubject classSubject
        if (params.id) { //update Currency
            classSubject = ClassSubject.get(classSubjectCommand.id)
            if (!classSubject) {
                //return json message
                return
            }
            classSubject.properties = classSubjectCommand.properties
            if (!classSubject.validate()) {
                //return json message
                return
            }
            classSubject.save(flush: true)
            //LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
            //flash.message = "Currency Updated successfully"
            //render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
            return
        }
        classSubject = new ClassSubject(classSubjectCommand.properties)
        if (!classSubjectCommand.validate()) {
            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
            return
        }
        ClassSubject savedCurr = classSubject.save(flush: true)
        if (!savedCurr) {
            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
        }

//        LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
//        flash.message = "Currency created successfully"
//        render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
        return

    }

    def delete(Long id) {
        ClassSubject classSubject = ClassSubject.get(id)
        if (!classSubject) {
            // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
        classSubject.save(flush: true)

        def result=[isError:false,message:"ClassSubject deleted g g successfully"]
        String outPut=result as JSON
        render outPut
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

    def update(Long id) {
        ClassSubject classSubject = ClassSubject.read(id)
        if (!classSubject) {
            // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
        //  render(template: '/coreBanking/settings/currency/createCurrency', model: [classSubject: classSubject])
    }

}

class ClassSubjectCommand {
    Long id
    String name
    String description

    static constraints = {
        name nullable: false
    }
}
