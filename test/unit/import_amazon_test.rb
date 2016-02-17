require 'test_helper'
require 'flashDeals'

class ImportAmazonTest < ActiveSupport::TestCase
  test "will pass" do
    assert true
  end
  
  test "test_call_browse_node_api" do
    http_client = OpenUriClient.new
    xml_parser = NokogiriParser.new
    amazon_api = AmazonApi.new(http_client, xml_parser)
    browse_node_id = "02619526011"
    expected_result = %w{B000TKDQ5C B00FLYWNYQ B00MVMCUK8 B00V9JP8EE B006LXOJC0 B001CQTLJM B003N1ZSYG B002QAYJPO B001FWXKTA B005KMDV9A B000TKDQ5C B00FLYWNYQ B00MVMCUK8 B00V9JP8EE B006LXOJC0 B001CQTLJM B003N1ZSYG B002QAYJPO B001FWXKTA B005KMDV9A}
    parsed_item = amazon_api.call_browse_node_api(browse_node_id)
    parsed_result = parsed_item.map {|item| item.content}
    assert_equal expected_result, parsed_result
  
  end
  
end
