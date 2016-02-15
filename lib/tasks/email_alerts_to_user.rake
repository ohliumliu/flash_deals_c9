desc 'Send alerts to all users'
task email_alerts_to_user: :environment do
  # ... set options if any
  User.all.each do |user|
    UserMailer.alert_email(user).deliver_now unless user.email.empty?
  end

end