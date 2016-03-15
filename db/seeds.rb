#require 'date'

Role.create(title: "system_admin")
Role.create(title: "client")
Role.create(title: "advocate")
CaseType.create(case_type: "murder", amount: 10)
CaseType.create(case_type: "accident", amount: 1)
CaseType.create(case_type: "divorse", amount: 20)
Case.create(case_title: "murder", location: "Ahmedabad",case_type_id: 1,case_detail:"hi", user_id: 2,created_at: Time.now)
Case.create(case_title: "accident", location: "rajkot",case_type_id: 2,case_detail:"hi", user_id: 2)
Case.create(case_title: "divorse", location: "junagadh",case_type_id: 3,case_detail:"hi", user_id: 2)
 User.create(email: "admin@gmail.com",role_id: 1,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
  User.create(email: "client@gmail.com",role_id: 2,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)
   User.create(email: "advocate@gmail.com",role_id: 3,password: "123456789",confirmed_at: Time.now,confirmation_sent_at: Time.now)