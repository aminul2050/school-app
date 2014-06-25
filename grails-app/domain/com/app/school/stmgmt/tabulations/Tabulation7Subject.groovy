package com.app.school.stmgmt.tabulations

import com.app.school.settings.Exam
import com.app.school.stmgmt.Tabulation

class Tabulation7Subject{
    Exam exam
//    Student student
    String studentId
    String studentName

    String subject1Name
    Integer subject1Mark
    Integer subject1Gpa

    String subject2Name
    Integer subject2Mark
    Integer subject2Gpa

    String subject3Name
    Integer subject3Mark
    Integer subject3Gpa

    String subject4Name
    Integer subject4Mark
    Integer subject4Gpa

    String subject5Name
    Integer subject5Mark
    Integer subject5Gpa

    String subject6Name
    Integer subject6Mark
    Integer subject6Gpa

    Integer subject7Mark

    static constraints = {
    }
    static mapping = {
        tablePerHierarchy true
    }
}
