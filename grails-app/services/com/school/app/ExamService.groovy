package com.school.app

import com.app.school.settings.Exam
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ExamService {

    static final String[] sortColumns = ['id','name']
    LinkedHashMap ExamPaginateList(GrailsParameterMap params){
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
        def c =  Exam.createCriteria()
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
            String startDateStr
            String publishDateStr

            results.each { Exam exam ->
                if (sSortDir.equals(CommonUtils.SORT_ORDER_ASC)) {
                    serial++
                } else {
                    serial--
                }
                startDateStr =exam.startDate? CommonUtils.getUiDateStr(exam.startDate):''
                publishDateStr =exam.publishedDate? CommonUtils.getUiDateStr(exam.publishedDate):'Not Published'
                dataReturns.add([DT_RowId: exam.id, 0: serial, 1: exam.className.name, 2:exam.section? exam.section.name:"All Section", 3: exam.examType.value, 4: exam.name, 5: startDateStr, 6: exam.examStatus.value, 7: publishDateStr, 8: ''])
            }
        }
        return [totalCount:totalCount,results:dataReturns]
    }

}