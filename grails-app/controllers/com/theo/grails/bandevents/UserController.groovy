package com.theo.grails.bandevents

import core.Role
import core.User
import core.UserRole

class UserController {

    def index() {
        def usersList = User.list()
        def roles = Role.list()

        User user = new User(username: '', password: '')

        user.accountExpired = false
        user.accountLocked = false
        user.enabled = true
        user.passwordExpired = false

        render(view: '/user/index', model: [users: usersList, cleanUser: user, roles: roles])
    }

    def save() {
        User user;

        if(params.id) {
            user = User.get(params.id)
        } else {
            user = new User(username: params.username, password: params.password)
        }

        user.accountExpired = false
        user.accountLocked = false
        user.enabled = true
        user.passwordExpired = false

        user.validate()
        if(!user.hasErrors()) {
            user.save(flush: true)
            render("User registered successfully.")
        } else {
            render("Some error occurred, try again.")
        }

        Role role = Role.findByAuthority(params.roleName)

        println role.authority
        println role.id

        new UserRole(user: user, role: role).save(flush: true)
    }

    def list () {
        def usersList = User.list()
        def roles = Role.list()

        render(template: '/user/list-users', model: [users: usersList, roles: roles])
    }

    def edit() {
        User user = User.get(params.id)
        render(template: '/user/register-form', model: [user: user])
    }

    def remove() {
        def user = User.get(params.id)

        if(user) {
            UserRole.findByUser(user).delete()

            user.delete(flush: true)
        }
        this.list()
    }
}
