  require "open-uri"
  require 'nokogiri'
  require 'time'
  require 'uri'
  require 'openssl'
  require 'base64' 
  require 'logger' 
  class AmazonApi
    # Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
    AWS_SECRET_KEY = "Wf8QQfudYwtpnUgozqR2VfUpOzet/tEo+1vGVcag"

    # The region you are interested in
    ENDPOINT = "webservices.amazon.com"

    REQUEST_URI = "/onca/xml"
 
    def initialize(http_client, xml_parser)
      @http_client = http_client
      @xml_parser = xml_parser
    end

    def call_browse_node_api(node_id)
      args = {
        "Operation" => "BrowseNodeLookup",
        "BrowseNodeId" => node_id,
        "ResponseGroup" => "TopSellers"
      }
      url = get_url(args)
      @xml_parser.parse_browse_node(@http_client.get(url))
    end

    def call_item_lookup_api(asin)
      args = {
        "Operation" => "ItemLookup",
        "ItemId" => asin,
        "IdType" => "ASIN",
        "ResponseGroup" => "Large,PromotionSummary"
      }
      url = get_url(args)
      @xml_parser.parse_item_lookup(@http_client.get(url))
    end
   
    def get_url(args)
      request_params = {
        "Service" => "AWSECommerceService",
        "AWSAccessKeyId" => "AKIAJOWJPSCFZWOSUDAQ",
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


  class OpenUriClient
    def get(url)
      open(url)
    end
  end


  class NokogiriParser
    def parse_browse_node(xml_string)  
      browse_node_response = Nokogiri::XML(xml_string)
      browse_node_response.css("//ASIN")
    end

    def parse_item_lookup(xml_string)  
      product = Hash.new
      begin
        item_response = Nokogiri::XML(xml_string)
        product[:detail_page_url]=item_response.at_css("//DetailPageURL").content
        product[:small_image_url]=item_response.css("//SmallImage//URL").first.content
        product[:medium_image_url]=item_response.css("//MediumImage//URL").first.content
        product[:list_price]=item_response.at_css("//ListPrice/Amount").content.to_i
	#sometimes price = list_price and we want to use SalePrice
        product[:price]=item_response.css("//OfferListing//Price//Amount").first.content.to_i
        product[:amount_saved]=item_response.css("//OfferListing//AmountSaved//Amount").first.content.to_i
        product[:percentage_saved]=item_response.css("//OfferListing//PercentageSaved").first.content.to_i
        product[:is_supersaver_shipping]=item_response.css("//OfferListing//IsEligibleForSuperSaverShipping").first.content
        product[:title]=item_response.at_css("//ItemAttributes//Title").content
        product[:ASIN] = item_response.at_css("//ASIN").content
        #merchant = Merchant.find_or_create_by(name: item_response.css("//Manufacturer").first.content)
        merchant = Merchant.where(name: item_response.css("//Manufacturer").first.content).first_or_create(name: item_response.css("//Manufacturer").first.content)
        product[:merchant_id]= merchant.id
        sleep(1)
	return product
      rescue NoMethodError => e
        puts "probably xml parser returns a nilclass, #{e.message}"
        #logger.error("probably xml parser returns a nilclass, #{e.message}")
#       rescue OpenURI::HTTPError => e
#       puts "failed to call amazon api, #{e.message}"
#       logger.error("failed to call amazon api, #{e.message}")
	sleep(1)
      end
    end   
  end
