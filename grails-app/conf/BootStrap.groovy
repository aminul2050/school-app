import com.app.school.settings.ClassName
import com.app.school.settings.ClassSubject
import com.app.school.settings.School
import com.app.school.settings.Section
import com.app.school.settings.Subject
import com.myapp.security.Role
import com.myapp.security.User
import com.myapp.security.UserRole

class BootStrap {

    def init = { servletContext ->
        createUserWithRole()
        createClassName()
        createSection()
        createSubjects()
        mapClassSubject()
    }
    void createClassName(){
        ClassName.findByName('Class 1')?:new ClassName(name: 'Class 1',description: 'Eligible age limit 3 to 5 only').save()
        ClassName.findByName('Class 2')?:new ClassName(name: 'Class 2',description: 'Eligible age limit 5 to 6 only').save()
      ClassName.findByName('Class 3')?:new ClassName(name: 'Class 3',description: 'Eligible age limit 6 to 7 only').save(flush: true)
      }
    void createSection(){
        ClassName className2 = ClassName.findByName('Class 2')
        Section.findByName('Morning Glory')?: new Section(name: 'Morning Glory',description: 'Some describtion', className: className2).save()
        Section.findByName('Blue Bird')?: new Section(name: 'Blue Bird',description: 'Some describtion', className: className2).save()
    }
    void createSubjects(){
        Subject.findByName('Bangla')?:new Subject(name: 'Bangla',description: 'Bangla for all students',ctMark: 30,hallMark: 80).save()
        Subject.findByName('English')?:new Subject(name: 'English',description: 'Bangla for all students',ctMark: 30,hallMark: 80).save()
        Subject.findByName('Mathematics')?:new Subject(name: 'Mathematics',description: 'Bangla for all students',ctMark: 30,hallMark: 80).save()
        Subject.findByName('Physics')?:new Subject(name: 'Physics',description: 'Bangla for all students',ctMark: 30,hallMark: 80,isOptional: true).save()
        Subject.findByName('Biology')?:new Subject(name: 'Biology',description: 'Bangla for all students',ctMark: 30,hallMark: 80,isOptional: true).save()
    }
    void mapClassSubject(){
        Subject bangla = Subject.findByName('Bangla')
        Subject english = Subject.findByName('English')
        Subject physics = Subject.findByName('Physics')
        Subject biology = Subject.findByName('Biology')
        ClassName cls1 = ClassName.findByName('Class 1')
        ClassName cls2 = ClassName.findByName('Class 2')
        ClassName cls3 = ClassName.findByName('Class 3')
        ClassSubject.findByClassName(cls1)?:new ClassSubject(className: cls1,subjectIds: "${bangla.id},${english.id},${biology.id}").save()
        ClassSubject.findByClassName(cls2)?:new ClassSubject(className: cls2,subjectIds: "${bangla.id},${english.id},${physics.id}").save()
        ClassSubject.findByClassName(cls3)?:new ClassSubject(className: cls3,subjectIds: "${bangla.id},${english.id},${physics.id}").save(flush: true)
    }
    void createUserWithRole(){
        School school = School.findByName('Baily School')
        if(!school){
            school = new School(name:'Baily School')
            school.id=10000
            school.save()
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
