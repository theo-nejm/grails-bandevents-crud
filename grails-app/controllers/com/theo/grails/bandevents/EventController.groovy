package com.theo.grails.bandevents

class EventController {

    def index() {
        def eventsList = Event.list()
        Event event = new Event()
        def bands = Band.list()

        event.name = ''
        event.date = new Date()
        event.bands = new TreeSet<Band>()

        render(view: '/event/index', model: [events: eventsList, cleanEvent: event, bandsList: bands])
    }

    def save() {
        Event event

        if(params.id) {
            event = Event.get(params.id)
        } else {
            event = new Event()
        }

        String formattedDate = params.date.replaceAll('-', '/')

        Date date = new Date().parse("yyyy/MM/dd", formattedDate)

        String[] bands = params.bands

        Set<Band> bandsList = new HashSet<Band>()

        for (String bandId: bands) {
            def band = Band.get(Integer.parseInt(bandId))
            println band.name

            bandsList.add(band)
        }

        event.setBands(bandsList)

        event.name = params.name
        event.date = date

        event.validate()
        if(!event.hasErrors()) {
            event.save(flush: true)
            render("Band registered successfully.")
        } else {
            render("Any error occurred, try again.")
        }
    }

    def list () {
        def eventsList = Event.list()

        render(template: '/event/list-events', model: [events: eventsList])
    }

    def remove() {
        def event = Event.get(params.id)
        if(event) {event.delete(flush: true)}

        this.list()
    }

    def edit() {
        Event event = Event.get(params.id)
        Band[] bands = Band.list()

        render(template: '/event/register-form', model: [event: event, bands: bands])
    }
}
