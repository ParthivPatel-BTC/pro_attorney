class UserMailer < ApplicationMailer
 default from: 'demo.botree@gmail.com'
 helper :application
  def purchase(client,advocate,cu)
  	@cu=cu
  	recipients = [client.email,advocate.email]
  	mail(from: "demo.botree@gmail.com", to: recipients, subject: "Your case has been purchased")
 end
end