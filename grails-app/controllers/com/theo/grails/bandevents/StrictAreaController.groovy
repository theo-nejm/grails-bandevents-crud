package com.theo.grails.bandevents

class StrictAreaController {
    def index() {}

    def login() {
        render(view: '/strictArea/login')
    }

    def register() {
        render(view: '/strictArea/register')
    }

    def saveUser() {

    }

    def logout() {
        redirect(action: 'login')
    }
}
