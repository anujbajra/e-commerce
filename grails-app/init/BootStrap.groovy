import e.commerce.statistics.Role
import e.commerce.statistics.User
import e.commerce.statistics.UserRole

class BootStrap {

    def init = { servletContext ->

        def userRole = new Role('ROLE_USER').save()

        def me = new User('admin', 'admin').save()

        UserRole.create me, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
    def destroy = {
    }
}
