desc "This task send email about unfilled estimations daily at 8 am."
task :send_email_notification => :environment do
  User.all.each do |user|
    if user.estimations.map{|e| e.complexity}.include?(nil)
      UserMailer.notification_email_on_unestimated_tasks(user).deliver
    end
  end
end
