package com.theo.grails.bandevents

import core.User

class StrictAreaController {
    def index() {}

    def login() {
        render(view: '/strictArea/login')
    }

    def register() {
        render(view: '/user/index')
    }

    def saveUser() {
        User user = new User();

        user.username = params.username
        user.password = params.password

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

    def logout() {
        redirect(action: 'login')
    }
}
