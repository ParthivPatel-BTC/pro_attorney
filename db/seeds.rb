#require 'date'

Role.create(title: "system_admin")
Role.create(title: "client")
Role.create(title: "advocate")
CaseType.create(case_type: "murder", amount: 10)
CaseType.create(case_type: "accident", amount: 1)
CaseType.create(case_type: "divorse", amount: 20)
# Case.create(case_title: "murder", location: "string", case_detail: "string", case_document: "TIC.pdf", status: "string",case_type_id: 1, user_id: 2)
# Case.create(case_title: "accident", location: "string", case_detail: "string", case_document: "TIC.pdf", status: "string",case_type_id: 2, user_id: 2)
# Case.create(case_title: "divorse", location: "string", case_detail: "string", case_document: "TIC.pdf", status: "string",case_type_id: 3, user_id: 2)
 User.create(email: "admin@gmail.com",role_id: 1,password: "abcd1234",confirmed_at: Time.now,confirmation_sent_at: Time.now)