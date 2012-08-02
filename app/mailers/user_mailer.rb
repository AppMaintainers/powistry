class UserMailer < ActionMailer::Base
  default from: "info@powistry.com"
  
  def notification_email_on_unestimated_tasks(user)
    @user = user
    attachments.inline['mail_notification.jpg'] = File.read('app/assets/images/mail_notification.jpg')
    mail(:to => user.email, :subject => "You have tasks to give estimations on") 
  end
end
