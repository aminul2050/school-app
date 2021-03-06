package com.school.app.settings

import com.app.school.settings.Section
import com.app.school.settings.ClassName
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class SectionController {

    def sectionService

    def index() {
        LinkedHashMap resultMap = sectionService.sectionPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'section', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'section', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }

    def save(SectionCommand sectionCommand) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        if (sectionCommand.hasErrors()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Section section
        if (params.id) { //update Currency
            section = Section.get(sectionCommand.id)
            if (!section) {
                result.put('message','Section not found')
                outPut=result as JSON
                render outPut
                return
            }
            section.properties = sectionCommand.properties
            if (!section.validate()) {
                result.put('message','Please fill the form correctly')
                outPut=result as JSON
                render outPut
                return
            }
            Section savedSection =section.save()
            result.put('isError',false)
            result.put('message','Section Updated successfully')
            outPut=result as JSON
            render outPut
            return
        }
        section = new Section(sectionCommand.properties)
        if (!sectionCommand.validate()) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        Section savedCurr = section.save(flush: true)
        if (!savedCurr) {
            result.put('message','Please fill the form correctly')
            outPut=result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('message','Section updated successfully')
        outPut=result as JSON
        render outPut

    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError',true)
        String outPut
        Section section = Section.get(id)
        if(section) {
            try {
                section.delete(flush:true)
                result.put('isError',false)
                result.put('message',"Section deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch(DataIntegrityViolationException e) {
                result.put('isError',true)
                result.put('message',"Section could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError',true)
        result.put('message',"Section not found")
        outPut = result as JSON
        render outPut
        return
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap =sectionService.sectionPaginateList(params)

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
        Section section = Section.read(id)
        if (!section) {
            result.put('message','Section name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError',false)
        result.put('obj',section)
        outPut = result as JSON
        render outPut
    }

}

class SectionCommand {
    Long id
    ClassName className
    String name
    String description

    static constraints = {
        name nullable: false
        className nullable: false
        description nullable: true
    }
}
