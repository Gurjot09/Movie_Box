namespace :mail do
desc 'send digest email'

task send_digest_email: :environment do
  # ... set options if any
  @users=User.all

  @users.each do|user|
  	UserMailer.weekly_mails(user).deliver!
  debugger
  end
end
end