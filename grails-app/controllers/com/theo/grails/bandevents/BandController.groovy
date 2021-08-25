package com.theo.grails.bandevents

class BandController {

    def index() {
        def bandsList = Band.list()

        Band band = new Band()
        band.name = ''
        render(view: '/band/index', model: [bands: bandsList, cleanBand: band])
    }

    def save() {
        Band band;

        if(params.id) {
            band = Band.get(params.id)
        } else {
            band = new Band()
        }

        band.name = params.name

        band.validate()
        if(!band.hasErrors()) {
            band.save(flush: true)
            render("Band registered successfully.")
        } else {
            render("Any error occurred, try again.")
        }
    }

    def list () {
        def bandsList = Band.list()

        render(template: '/band/list-bands', model: [bands: bandsList])
    }

    def edit() {
        Band band = Band.get(params.id)
        render(template: '/band/register-form', model: [band: band])
    }

    def remove() {
        def band = Band.get(params.id)

        if(band) {
            List<Event> relatedEvents = Event.createCriteria().list{ bands { eq ('id', params.id.toLong()) } }
            relatedEvents.each { event -> event.removeFromBands band }

            band.delete(flush: true)

        }
        this.list()
    }
}
