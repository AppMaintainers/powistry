task :send_email_notification => :environment do
  user = User.find_by_email('erdosboti@gmail.com')
  UserMailer.notification_email_on_unestimated_tasks(user).deliver
end
