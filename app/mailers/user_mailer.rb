class UserMailer < ActionMailer::Base
  default from: "info@powistry.com"
  
  def notification_email_on_unestimated_tasks(user)
    @user = user
    mail(:to => user.email, :subject => "You have tasks to give estimations on") 
  end
end
