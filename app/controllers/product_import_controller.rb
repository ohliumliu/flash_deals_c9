class ProductImportController 
  require 'flashDeals'
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
          Product.create(product_hash)
          puts "one product added to database"
        end
      end
      
    end
  end

end
