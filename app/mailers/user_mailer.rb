class UserMailer < ApplicationMailer
 default from: 'demo.botree@gmail.com'
 # add_template_helper()
  def purchase(client,advocate)
   
       client1=client
      
      advocate1=advocate
  recipients = [client1.email, advocate1.email]
  mail(from: "demo.botree@gmail.com", to: recipients, subject: "Hi!!!")


  end
end