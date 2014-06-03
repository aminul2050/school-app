package com.school.app.settings
import com.app.school.settings.Subject
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPER_ADMIN'])
class SubjectController {

    def subjectService

    def index() {
        print("params----------"+params)
        LinkedHashMap resultMap = subjectService.subjectPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'subject', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'subject', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

//    def index() {
//
//        print("params-------------------"+params)
//        print("params-------------------"+params.name)
//        LinkedHashMap resultMap = subjectService.subjectPaginateList(params)
//
//        if (!resultMap || resultMap.totalCount == 0) {
//            render(view: 'subject', model: [dataReturn: null, totalCount: 0])
//            return
//        }
//        int totalCount = resultMap.totalCount
//        render(view: 'subject', model: [dataReturn: resultMap.results, totalCount: totalCount])
//    }

    def save(ClassNameCommand subjectCommand) {


        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (subjectCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Subject subject
        if (params.id) { //update Currency
            subject = Subject.get(subjectCommand.id)
            if (!subject) {
                result.put('message','Subject not found')
                outPut=result as JSON
                render outPut
                return
            }
            subject.properties = subjectCommand.properties
            if (!subject.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            Subject savedClass =subject.save()
            result.put('isError',false)
            result.put('message','Subject Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        subject = new Subject(subjectCommand.properties)
        if (!subjectCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Subject savedCurr = subject.save(flush: true)
        if (!savedCurr) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('message','Subject updated successfully')
        outPut=result as JSON
        render outPut

    }

    def delete(Long id) {
        Subject subject = Subject.get(id)
        if (!subject) {
            // flash.message = "Currency not found"
            //render(template: '/coreBanking/settings/currency/currencyList')
        }
        subject.delete(flush: true)

        def result=[isError:false,message:"Subject deleted g g successfully"]
        String outPut=result as JSON
        render outPut
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =subjectService.subjectPaginateList(params)

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
        Subject subject = Subject.read(id)
        if (!subject) {
            result.put('message','Subject name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',subject)
        outPut = result as JSON
        render outPut
    }

}

class SubjectCommand {
    Long id
    String name
    String description
    Integer ctMark
    Integer hallMark
    Boolean compulsory =true

    static constraints = {
        name nullable: false
    }
}
