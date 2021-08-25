package com.theo.grails.bandevents

class Band {
    String name;

    static hasMany = [events: Event]

    static belongsTo = [Event]

    static constraints = {
        name nullable: false, blank: false, unique: true
    }

    static mapping = {
    }
}
