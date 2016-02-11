class ImportAmazonJob < ProgressJob::Base
  def initialize(progress_max=100)
    super progress_max: progress_max
  end

  def perform
    puts "progress job"
    update_stage('Importing Amazon') 
    #ProductImportController.new.import_amazon
    import_amazon
    
  end
  
  def import_amazon
    Product.destroy_all
    Merchant.destroy_all
    http_client = OpenUriClient.new
    xml_parser = NokogiriParser.new
    amazon_api = AmazonApi.new(http_client, xml_parser)
    Catalog.all.each do |catalog|
      amazon_api.call_browse_node_api(catalog.browse_node_id).each do |item|
      product_hash = amazon_api.call_item_lookup_api(item.content)
        if (product_hash.class == Hash)
          product_hash[:catalog_id] = catalog.id
          new_product = Product.new(product_hash)
          if new_product.save
            puts "one product added to database"
            puts Product.all.count
            update_progress(step: 1)
          end
        end
      end
    end
  end
  
end