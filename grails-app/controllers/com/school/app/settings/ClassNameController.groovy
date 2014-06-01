package com.school.app.settings

import com.app.school.settings.ClassName
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

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
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (classNameCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        ClassName className
        if (params.id) { //update Currency
            className = ClassName.get(classNameCommand.id)
            if (!className) {
                result.put('message','Class not found')
                outPut=result as JSON
                render outPut
                return
            }
            className.properties = classNameCommand.properties
            if (!className.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            ClassName savedClass =className.save()
            result.put('isError',false)
            result.put('message','Class Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        className = new ClassName(classNameCommand.properties)
        if (!classNameCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        ClassName savedCurr = className.save(flush: true)
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
        ClassName className = ClassName.get(id)
        if(className) {
            try {
                println "+++++++++++++++++++++++++"
                className.delete(flush:true)
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

    def edit(Long id) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        ClassName className = ClassName.read(id)
        if (!className) {
            result.put('message','Class name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',className)
        outPut = result as JSON
        render outPut
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
