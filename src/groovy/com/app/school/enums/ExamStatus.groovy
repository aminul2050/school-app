package com.app.school.enums

/**
 * Created by Hasnat on 5/27/2014.
 */
public enum ExamStatus {
    MARKENTRY("Mark Entry"),
    CHECKING("Checking"),
    PUBLISHED("Published"),

    final String value
    ExamStatus(String value) {
        this.value = value
    }
    String toString() { value }
    String getKey() { name() }

}