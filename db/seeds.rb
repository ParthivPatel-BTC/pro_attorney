#require 'date'

Role.create(title: "system_admin")
Role.create(title: "client")
Role.create(title: "advocate")
CaseType.create(case_type: "murder")
CaseType.create(case_type: "accident")
CaseType.create(case_type: "divorse")
# Case.create(case_title: "murder", location: "string", case_detail: "string", case_document: "TIC.pdf", status: "string",case_type_id: 1, user_id: 2)
# Case.create(case_title: "accident", location: "string", case_detail: "string", case_document: "TIC.pdf", status: "string",case_type_id: 2, user_id: 2)
# Case.create(case_title: "divorse", location: "string", case_detail: "string", case_document: "TIC.pdf", status: "string",case_type_id: 3, user_id: 2)

# User.create (email:"advocate@gmail.com",password:"123456789")
#User.create (email:"advocate@gmail.com",password:"123456789",sign_in_count: 0,current_sign_in_at:DateTime.new(2001,2,3,4,5,6),last_sign_in_at:DateTime.new(2001,2,3,4,5,6),confirmed_at: DateTime.new(2001,2,3,4,5,6),confirmation_sent_at: DateTime.new(2001,2,3,4,5,6),failed_attempts: 0,created_at: DateTime.new(2001,2,3,4,5,6), updated_at: DateTime.new(2001,2,3,4,5,6), role_id: "3")