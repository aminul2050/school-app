package com.app.school.enums

/**
 * Created by Hasnat on 5/28/2014.
 */
public enum AdmissionType {

    NEWADMISSION("New AdmissionInfo"),
    ADMISSION("AdmissionInfo"),
    READMISSION("Re AdmissionInfo"),

    final String value
    AdmissionType(String value) {
        this.value = value
    }
    String toString() { value }
    String getKey() { name() }

}