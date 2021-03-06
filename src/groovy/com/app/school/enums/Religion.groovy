package com.app.school.enums

/**
 * Created by Hasnat on 5/27/2014.
 */
public enum Religion {

    MUSLIM("Muslim"),
    HINDU("Hindu"),
    CHRISTIAN("Christian"),
    BUDDHIST("Buddhist"),

    final String value
    Religion(String value) {
        this.value = value
    }

    String toString() { value }
    String getKey() { name() }

}