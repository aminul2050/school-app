package com.school.app.settings

import com.app.school.settings.ClassName
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPER_ADMIN'])
class ClassNameController {
    def classNameService

    def index() {
        LinkedHashMap resultMap = classNameService.classNamePaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'className', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'className', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

    def save(ClassNameCommand classNameCommand) {
        if (!request.method == 'POST') {
            //return json message
            return
        }
        if (classNameCommand.hasErrors()) {
            //return json message
            return
        }
        ClassName className
        if (params.id) { //update Currency
            className = ClassName.get(classNameCommand.id)
            if (!className) {
                //return json message
                return
            }
            className.properties = classNameCommand.properties
            if (!className.validate()) {
                //return json message
                return
            }
            className.save(flush: true)
            //LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
            //flash.message = "Currency Updated successfully"
            //render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
            return
        }
        className = new ClassName(classNameCommand.properties)
        if (!classNameCommand.validate()) {
            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
            return
        }
        ClassName savedCurr = className.save(flush: true)
        if (!savedCurr) {
            //render(template: '/coreBanking/settings/currency/createCurrency', model: [currencys: currencys])
        }

//        LinkedHashMap resultMap = currencyService.currencyPaginateList(params)
//        flash.message = "Currency created successfully"
//        render(template: '/coreBanking/settings/currency/currencyList', model: [dataReturn: resultMap.results, totalCount: resultMap.totalCount])
        return

    }

    def delete(Long id) {
        ClassName className = ClassName.get(id)
        if (!className) {
           // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
        className.save(flush: true)

        def result=[isError:false,message:"ClassName deleted g g successfully"]
        String outPut=result as JSON
        render outPut
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =classNameService.classNamePaginateList(params)

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
        ClassName className = ClassName.read(id)
        if (!className) {
           // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
      //  render(template: '/coreBanking/settings/currency/createCurrency', model: [className: className])
    }

}

class ClassNameCommand {
    Long id
    String name
    String description

    static constraints = {
        name nullable: false
    }
}
