package com.school.app

import com.app.school.settings.ClassSubject
import com.app.school.settings.Exam
import com.app.school.settings.ExamMark
import com.app.school.settings.Subject
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ExamMarkService {
    def subjectService

    static final String[] sortColumns = ['id','student','mark','mark']
    LinkedHashMap examMarkPaginateList(GrailsParameterMap params, Exam exam, Subject subject){
        println(params)
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
        def c = ExamMark.createCriteria()
        def results = c.list(max: iDisplayLength, offset: iDisplayStart) {
            and {
                eq("schoolId", CommonUtils.DEFAULT_SCHOOL_ID)
                eq("exam",exam)
                eq("subject",subject)
            }
            if (sSearch) {
                or {
                    ilike('student.studentName', sSearch)
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
            results.each { ExamMark examMark ->
                if (sSortDir.equals(CommonUtils.SORT_ORDER_ASC)) {
                    serial++
                } else {
                    serial--
                }
                dataReturns.add([DT_RowId: examMark.id, 0: serial, 1: examMark.student.studentName,2:examMark.mark, 3:examMark.gpa,4:examMark.grade,5:examMark.description, 6: ''])
            }
        }
        return [totalCount:totalCount,results:dataReturns]
    }


    LinkedHashMap examIniPaginateList(GrailsParameterMap params){
        int iDisplayStart = params.iDisplayStart ? params.getInt('iDisplayStart') : CommonUtils.DEFAULT_PAGINATION_START
//        int iDisplayLength = params.iDisplayLength ? params.getInt('iDisplayLength') : CommonUtils.DEFAULT_PAGINATION_LENGTH
        String sSortDir = params.sSortDir_0 ? params.sSortDir_0 : CommonUtils.DEFAULT_PAGINATION_SORT_ORDER
//        int iSortingCol = params.iSortingCols ? params.getInt('iSortingCols') : CommonUtils.DEFAULT_PAGINATION_SORT_IDX
//        //Search string, use or logic to all fields that required to include
//        String sSearch = params.sSearch ? params.sSearch : null
//        if (sSearch) {
//            sSearch = CommonUtils.PERCENTAGE_SIGN + sSearch + CommonUtils.PERCENTAGE_SIGN
//        }
//        String sortColumn = CommonUtils.getSortColumn(sortColumns,iSortingCol)
        List dataReturns = new ArrayList()
        def c = Exam.createCriteria()
        def results = c.list() {
            and {
                eq("schoolId", CommonUtils.DEFAULT_SCHOOL_ID)
            }
            order('name', sSortDir)
        }
        int totalCount = results.size()
        int serial = iDisplayStart;
        if (totalCount > 0) {
            if (sSortDir.equals(CommonUtils.SORT_ORDER_DESC)) {
                serial = (totalCount + 1) - iDisplayStart
            }
            def subjectList
            results.each { Exam exam ->
                if (sSortDir.equals(CommonUtils.SORT_ORDER_ASC)) {
                    serial++
                } else {
                    serial--
                }
                subjectList =subjectService.getSubjects(exam.notCompletedYet)
                dataReturns.add([DT_RowId: exam.id, 0: serial, 1: exam.className.name, 2:exam.section? exam.section.name:"All Section", 3: exam.examType.value, 4: exam.name,5:subjectList, 6: exam.examStatus])
            }
        }
        return [totalCount:totalCount,results:dataReturns]
    }

}
