import com.app.school.settings.School
import com.myapp.security.Role
import com.myapp.security.User
import com.myapp.security.UserRole

class BootStrap {

    def init = { servletContext ->
        createUserWithRole()
    }
    void createUserWithRole(){
        School school = School.findByName('Baily School')
        if(!school){
            school = new School('Baily School')
            school.id=10000
        }
        Role superAdmin = Role.findByAuthority("ROLE_SUPER_ADMIN")
        if(!superAdmin){
            superAdmin = new Role(authority: 'ROLE_SUPER_ADMIN').save()
        }
        Role admin = Role.findByAuthority("ROLE_ADMIN")
        if(!admin){
            admin = new Role(authority: 'ROLE_ADMIN').save()
        }

        User superAdminUser = User.findByUsername('admin')
        if(!superAdminUser){
//            superAdminUser = new User(username: 'admin',firstName: 'Super',lastName: 'Admin',email: 'admin@gmail.com',telephone: '01930270050',lastLogin: new Date(), password: 'password', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            superAdminUser = new User(username: 'admin', password: 'password',schoolId: 10000, enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            superAdminUser.save(flush: true)

            new UserRole(user: superAdminUser, role: superAdmin).save(flush: true)
        }
    }
    def destroy = {
    }
}
