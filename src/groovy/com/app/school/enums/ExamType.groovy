package com.app.school.enums

/**
 * Created by Hasnat on 5/27/2014.
 */
public enum ExamType {

    CLASSTEST1("Class Test 1"),
    CLASSTEST2("Class Test 2"),
    HALLTEST("Hall Test"),

    final String value
    ExamType(String value) {
        this.value = value
    }
    String toString() { value }
    String getKey() { name() }

}