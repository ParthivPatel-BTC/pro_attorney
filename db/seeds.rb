# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(title: "system_admin")
Role.create(title: "client")
Role.create(title: "advocate")
CaseType.create(case_type: "murder")
CaseType.create(case_type: "accident")
CaseType.create(case_type: "divorse")



# User.create (email:"karan@gmail.com",password:"123456789",sign_in_count: 2,current_sign_in_at:"2016-02-18 19:58:55",last_sign_in_at: "2016-02-18 19:57:04",confirmed_at: "2016-02-18 16:32:33",confirmation_sent_at: "2016-02-18 16:32:06",failed_attempts: 0,created_at: "2016-02-18 16:32:06", updated_at: "2016-02-18 19:58:55", role_id: "1")