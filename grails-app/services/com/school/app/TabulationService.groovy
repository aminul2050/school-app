package com.school.app

import com.app.school.settings.ClassSubject
import com.app.school.settings.Exam
import com.app.school.settings.ExamMark
import com.app.school.settings.Subject
import com.app.school.stmgmt.Tabulation
import grails.transaction.Transactional

@Transactional
class TabulationService {

    def markSubjectComplete(Exam exam, Subject subject){
        ClassSubject classSubject = ClassSubject.findByClassName(exam.className)
        int numberOfSubjects = 6//classSubject.numberOfSubject
        int subjectIndex = CommonUtils.subjectIndexInCls(classSubject.subjectIds, subject.id)
        String markToEntry = "subject${subjectIndex}Mark"
        def allExamMarks = ExamMark.findAllByExamAndSubject(exam,subject)
        if(allExamMarks.size()==0){
            return false
        }
        def tabulation
        switch (numberOfSubjects){
            case 6:
                allExamMarks.each {ExamMark examMark ->
                  tabulation = Tabulation.findByExamAndStudentId(exam, examMark.student.studentID)
                    if(tabulation){
                        tabulation."${markToEntry}"=examMark.mark
                        tabulation.save()
                    }else {
                        tabulation = new Tabulation(exam:exam, studentId: examMark.student.studentID, studentName: examMark.student.studentName, markToEntry:examMark.mark).save()
                    }
                }
                break;
            case 7:
                numDays = 31;
                break;
        }

    }
}
