desc "This task sends email about unfilled estimations daily at 8 am."
task :send_email_notification => :environment do
  User.all.each do |user|
    user.estimations.where(:complexity => nil).each do |est|
      UserMailer.notification_email_on_unestimated_tasks(user).deliver
    end
  end
end
