package com.theo.grails.bandevents

class Event {
    String name
    Date date

    boolean hasBand(Band band) {
        for(Band evBand: this.bands) {
            if(evBand.id == band.id) {
                return true
            }
        }

        return false
    }

    static hasMany = [bands: Band]

    static constraints = {
        name nullable: false, blank: false
        date nullable: false, blank: false
        bands nullable: false
    }

    static mapping = {
        bands cascade: 'all-delete-orphan'
    }
}
