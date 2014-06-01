package com.school.app

import com.app.school.settings.Subject
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class SubjectService {

    static final String[] sortColumns = ['id','name']
    LinkedHashMap classNamePaginateList(GrailsParameterMap  params){
        int iDisplayStart = params.iDisplayStart ? params.getInt('iDisplayStart') : CommonUtils.DEFAULT_PAGINATION_START
        int iDisplayLength = params.iDisplayLength ? params.getInt('iDisplayLength') : CommonUtils.DEFAULT_PAGINATION_LENGTH
        String sSortDir = params.sSortDir_0 ? params.sSortDir_0 : CommonUtils.DEFAULT_PAGINATION_SORT_ORDER
        int iSortingCol = params.iSortingCols ? params.getInt('iSortingCols') : CommonUtils.DEFAULT_PAGINATION_SORT_IDX
        //Search string, use or logic to all fields that required to include
        String sSearch = params.sSearch ? params.sSearch : null
        if (sSearch) {
            sSearch = CommonUtils.PERCENTAGE_SIGN + sSearch + CommonUtils.PERCENTAGE_SIGN
        }
        String sortColumn = CommonUtils.getSortColumn(sortColumns,iSortingCol)
        List dataReturns = new ArrayList()
        def c = Subject.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("schoolId", CommonUtils.DEFAULT_SCHOOL_ID)
            }
            if (sSearch) {
                or {
                    ilike('name', sSearch)
                }
            }
            order(sortColumn, sSortDir)
        }
        int totalCount = results.totalCount
        int serial = iDisplayStart;
        if (totalCount > 0) {
            if (sSortDir.equals(CommonUtils.SORT_ORDER_DESC)) {
                serial = (totalCount + 1) - iDisplayStart
            }
            results.each { Subject subject ->
                if (sSortDir.equals(CommonUtils.SORT_ORDER_ASC)) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: subject.id, 0: serial, 1: subject.name,2:subject.description,3:subject.ctMark,4:subject.hallMark,5:subject.compulsory?'Compulsory':'Optional', 6: ''])
            }
        }
        return [totalCount:totalCount,results:dataReturns]
    }
    String getName(String ids){
        if(!ids){
            return "No subject Added"
        }
        def subjectIds = ids.split(',').collect{it as Long}
        if(!subjectIds){
            return "No subject Added"
        }
        def query = Subject.where {
            (schoolId == CommonUtils.DEFAULT_SCHOOL_ID && id in subjectIds)
        }
        def results = query.list()
        String subjectStr =""
        results.each {Subject subject ->
            if(subject.compulsory){
                subjectStr+= subject.name+", "
            }else {
                subjectStr+=subject.name+" (Optional), "
            }
        }
        return subjectStr
    }

}
