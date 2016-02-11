class ImportAmazonJob < ProgressJob::Base
  def initialize
  end

  def perform
    puts "progress job"
    update_stage('Importing Amazon') 
    ProductImportController.new.import_amazon
  end
end