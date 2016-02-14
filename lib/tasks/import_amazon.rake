desc 'import amazon'
task import_amazon: :environment do
  # ... set options if any
  user_id = User.where(isadmin: true).first.id
  Delayed::Job.enqueue ImportAmazonJob.new(user_id)

end