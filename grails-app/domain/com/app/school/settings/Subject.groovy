package com.app.school.settings

class Subject {
    String name
    Integer paperMark
    Integer passMark

    static constraints = {
        passMark(nullable: true)
    }
}
