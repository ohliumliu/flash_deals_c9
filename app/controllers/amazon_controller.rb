class AmazonController #< AdminController
  require "open-uri"
  require 'nokogiri'
  require 'time'
  require 'uri'
  require 'openssl'
  require 'base64' 
  require 'logger' 
  # Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
  AWS_SECRET_KEY = "Wf8QQfudYwtpnUgozqR2VfUpOzet#/#tEo+1vGVcag"

  # The region you are interested in
  ENDPOINT = "webservices.amazon.com"

  REQUEST_URI = "/onca/xml"
  
  def import
    Product.destroy_all
    Merchant.destroy_all
    Catalog.all.each do |catalog|
      args = {
        "Operation" => "BrowseNodeLookup",
        "BrowseNodeId" => catalog.browse_node_id,
        "ResponseGroup" => "TopSellers"
      }
#      puts get_url(args)

      browse_node_response = Nokogiri::XML(open(get_url(args)))
      browse_node_response.css("//ASIN").each do |item|
        args = {
          "Operation" => "ItemLookup",
          "ItemId" => item.content,
          "IdType" => "ASIN",
          "ResponseGroup" => "Large,PromotionSummary"
        }
        begin
          item_response = Nokogiri::XML(open(get_url(args)))
  	  #merchant = Merchant.find_or_create_by(name: item_response.css("//Manufacturer").first.content)
          merchant = Merchant.where(name: item_response.css("//Manufacturer").first.content).first_or_create(name: item_response.css("//Manufacturer").first.content)

          product = Product.new
          product.detail_page_url=item_response.at_css("//DetailPageURL").content
          product.small_image_url=item_response.css("//SmallImage//URL").first.content
          product.medium_image_url=item_response.css("//MediumImage//URL").first.content
          product.list_price=item_response.at_css("//ListPrice/Amount").content.to_i
	  #sometimes price = list_price and we want to use SalePrice
          product.price=item_response.css("//OfferListing//Price//Amount").first.content.to_i
          product.amount_saved=item_response.css("//OfferListing//AmountSaved//Amount").first.content.to_i
          product.percentage_saved=item_response.css("//OfferListing//PercentageSaved").first.content.to_i
          product.is_supersaver_shipping=item_response.css("//OfferListing//IsEligibleForSuperSaverShipping").first.content
          product.title=item_response.at_css("//ItemAttributes//Title").content
          product.merchant_id= merchant.id
          product.catalog_id=catalog.id
          product.ASIN= item.content

          product.save
                rescue NoMethodError => e
          puts "probably xml parser returns a nilclass, #{e.message}"
          #logger.error("probably xml parser returns a nilclass, #{e.message}")
#        rescue OpenURI::HTTPError => e
#          puts "failed to call amazon api, #{e.message}"
#          logger.error("failed to call amazon api, #{e.message}")
        end
        puts "one product added to database"
        sleep(1)
      end          
    end
  end
 
  private 
  def get_url(args)
    request_params = {
      "Service" => "AWSECommerceService",
      "AWSAccessKeyId" => "AKIAJOW#J#PSCFZWOSUDAQ",
      "AssociateTag" => "dealsoutlet04-20",
    }
    request_params=request_params.merge(args)
    
    # Set current timestamp if not set
    request_params["Timestamp"] = Time.now.gmtime.iso8601 if !request_params.key?("Timestamp")
    
    # Generate the canonical query
    canonical_query_string = request_params.sort.collect do |key, value|
      [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')
    
    # Generate the string to be signed
    string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"
    
    # Generate the signature required by the Product Advertising API
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), AWS_SECRET_KEY, string_to_sign)).strip()
    
    # Generate the signed URL
    request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
  end
end

