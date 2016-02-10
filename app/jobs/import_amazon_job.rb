class ImportAmazonJob < ProgressJob::Base
  def initialize
  end

  def perform
      user = User.all
      puts "progress job"
  end
end