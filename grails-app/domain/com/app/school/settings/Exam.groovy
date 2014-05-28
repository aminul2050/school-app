package com.app.school.settings

import com.app.school.enums.ExamStatus
import com.app.school.enums.ExamType

class Exam {
    School school
    ClassName className
    String name
    ExamType examType
    Date startDate
    Date endDate
    Date publishedDate
    ExamStatus examStatus = ExamStatus.MARKENTRY

    static constraints = {
        name(unique: true)
    }
}
