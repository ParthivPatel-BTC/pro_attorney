#require 'date'

Role.create(title: "system_admin")
Role.create(title: "client")
Role.create(title: "advocate")
CaseType.create(case_type: "Murder", amount: 1000)
CaseType.create(case_type: "Accident", amount: 400)
CaseType.create(case_type: "Divorse", amount: 200)
CaseType.create(case_type: "stealing", amount: 300)
CaseType.create(case_type: "robe", amount: 250)
CaseType.create(case_type: "cheat", amount: 150)
CaseType.create(case_type: "forgery", amount: 800)


User.create(email: "admin@gmail.com",role_id: 1,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)


User.create(email: "client@gmail1.com",role_id: 2,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "client@gmail2.com",role_id: 2,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "client@gmail3.com",role_id: 2,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "client@gmail4.com",role_id: 2,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "client@gmail5.com",role_id: 2,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)

User.create(email: "advocate@gmail1.com",role_id: 3,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "advocate@gmail2.com",role_id: 3,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "advocate@gmail3.com",role_id: 3,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "advocate@gmail4.com",role_id: 3,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
User.create(email: "advocate@gmail5.com",role_id: 3,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)


Case.create(case_title: "murder", location: "string", case_detail: "string", status: "open",case_type_id: 1, user_id: 2,is_active: true)
Case.create(case_title: "accident", location: "string", case_detail: "string", status: "open",case_type_id: 2, user_id: 2,is_active: true)
Case.create(case_title: "stealing", location: "string", case_detail: "string", status: "open",case_type_id: 3, user_id: 3,is_active: true)
Case.create(case_title: "divorse", location: "string", case_detail: "string", status: "open",case_type_id: 4, user_id: 3,is_active: true)
Case.create(case_title: "robe", location: "string", case_detail: "string", status: "open",case_type_id: 5, user_id: 4,is_active: true)
Case.create(case_title: "cheat", location: "string", case_detail: "string", status: "open",case_type_id: 6, user_id: 4,is_active: true)
Case.create(case_title: "forgery", location: "string", case_detail: "string", status: "open",case_type_id: 7, user_id: 5,is_active: true)
Case.create(case_title: "Murder", location: "string", case_detail: "string", status: "open",case_type_id: 1, user_id: 5,is_active: true)
Case.create(case_title: "Accident", location: "string", case_detail: "string", status: "open",case_type_id: 2, user_id: 6,is_active: true)
Case.create(case_title: "stealing", location: "string", case_detail: "string", status: "open",case_type_id: 4, user_id: 6,is_active: true)
Case.create(case_title: "forgery", location: "string", case_detail: "string", status: "open",case_type_id: 7, user_id: 2,is_active: true)


UserProfile.create(first_name: "karan", last_name: "admin", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 1)

UserProfile.create(first_name: "tapan", last_name: "client", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 2)
UserProfile.create(first_name: "rakesh", last_name: "client", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 3)
UserProfile.create(first_name: "jay", last_name: "client", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 4)
UserProfile.create(first_name: "vikas", last_name: "client", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 5)
UserProfile.create(first_name: "pramod", last_name: "client", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 6)

UserProfile.create(first_name: "lathiya", last_name: "advocate", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 7)
UserProfile.create(first_name: "parth", last_name: "advocate", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 8)
UserProfile.create(first_name: "sailesh", last_name: "advocate", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 9)
UserProfile.create(first_name: "meet", last_name: "advocate", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 10)
UserProfile.create(first_name: "pinak", last_name: "advocate", gender: "Male", mobile_no: "875845020", address: "nice place ", city: "somnath", pincode: "398898", user_id: 11)