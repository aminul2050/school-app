package com.school.app

import com.app.school.stmgmt.StudentDetails
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class StudentDetailsService {

    static final String[] sortColumns = ['id','studentID','fullName','email','cardNo']
    LinkedHashMap studentDetailsPaginateList(GrailsParameterMap params){
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
        def c = StudentDetails.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("schoolId", CommonUtils.DEFAULT_SCHOOL_ID)
            }
            if (sSearch) {
                or {
                    ilike('studentID', sSearch)
                    ilike('email', sSearch)
                    ilike('cardNo', sSearch)
                    ilike('firstName', sSearch)
                    ilike('lastName', sSearch)
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
            results.each { StudentDetails studentDetails ->
                if (sSortDir.equals(CommonUtils.SORT_ORDER_ASC)) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: studentDetails.id, 0: serial, 1: studentDetails.studentID,2:studentDetails.fullName, 3: studentDetails.email,4:studentDetails.cardNo,5:''])
            }
        }
        return [totalCount:totalCount,results:dataReturns]
    }

}
