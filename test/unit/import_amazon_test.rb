require 'test_helper'
require "mocha/test_unit"
require 'flashDeals'

class ImportAmazonTest < ActiveSupport::TestCase
  test "will pass" do
    assert true
  end
  
  test "test_call_browse_node_api" do
    mock_xml = <<-MOCK_XML
     <?xml version="1.0" ?>
<BrowseNodeLookupResponse
    xmlns="http://webservices.amazon.com/AWSECommerceService/2011-08-01">
    <OperationRequest>
        <HTTPHeaders>
            <Header Name="UserAgent" Value="Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:44.0) Gecko/20100101 Firefox/44.0"/>
        </HTTPHeaders>
        <RequestId>3ce3cdca-d545-11e5-9ab6-4132a3b80516</RequestId>
        <Arguments>
            <Argument Name="AWSAccessKeyId" Value="AKIAJOWJPSCFZWOSUDAQ"/>
            <Argument Name="AssociateTag" Value="dealsoutlet04-20"/>
            <Argument Name="BrowseNodeId" Value="02619526011"/>
            <Argument Name="Operation" Value="BrowseNodeLookup"/>
            <Argument Name="ResponseGroup" Value="TopSellers"/>
            <Argument Name="Service" Value="AWSECommerceService"/>
            <Argument Name="Signature" Value="frFrdrn/k2sG9jUAAlOT/V5X+H14k20p5lwtpAxeIpQ="/>
            <Argument Name="Timestamp" Value="2016-02-17T07:08:24.000Z"/>
        </Arguments>
        <RequestProcessingTime>0.03303305</RequestProcessingTime>
    </OperationRequest>
    <BrowseNodes>
        <Request>
            <IsValid>True</IsValid>
            <BrowseNodeLookupRequest>
                <BrowseNodeId>02619526011</BrowseNodeId>
                <ResponseGroup>TopSellers</ResponseGroup>
            </BrowseNodeLookupRequest>
        </Request>
        <BrowseNode>
            <BrowseNodeId>2619526011</BrowseNodeId>
            <Name>Categories</Name>
            <TopSellers>
                <TopSeller>
                    <ASIN>B000TKDQ5C</ASIN>
                    <Title>Lasko 754200 Ceramic Heater with Adjustable Thermostat</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B00FLYWNYQ</ASIN>
                    <Title>Instant Pot IP-DUO60 7-in-1 Programmable Pressure Cooker 6Qt/1000W, Stainless Steel Cooking Pot and Exterior</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B00MVMCUK8</ASIN>
                    <Title>BlenderBottle Classic Loop Top Shaker Bottle, Clear Black, 28 Ounce</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B00V9JP8EE</ASIN>
                    <Title>InnoGear® 100ml Aromatherapy Essential Oil Diffuser Portable Ultrasonic Cool Mist Aroma Humidifier with Color LED Lights Changing and Waterless Auto Shut-off Function for Home Office Bedroom Room</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B006LXOJC0</ASIN>
                    <Title>BLACK + DECKER CHV1410L 16 volt Lithium Cordless Dust Buster Hand Vac</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B001CQTLJM</ASIN>
                    <Title>KitchenIQ 50009 Edge Grip 2 Stage Knife Sharpener</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B003N1ZSYG</ASIN>
                    <Title>Samsung Da29-00020b Refrigerator Water Filter, 1-pack</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B002QAYJPO</ASIN>
                    <Title>Honeywell Germ Free Cool Mist Humidifier, HCM-350</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B001FWXKTA</ASIN>
                    <Title>Vicks Warm Mist Humidifier with Auto Shut-Off</Title>
                </TopSeller>
                <TopSeller>
                    <ASIN>B005KMDV9A</ASIN>
                    <Title>Shark Navigator Lift-Away Professional Upright (NV356E)</Title>
                </TopSeller>
            </TopSellers>
            <TopItemSet>
                <Type>TopSellers</Type>
                <TopItem>
                    <ASIN>B000TKDQ5C</ASIN>
                    <Title>Lasko 754200 Ceramic Heater with Adjustable Thermostat</Title>
                    <DetailPageURL>http://www.amazon.com/Lasko-754200-Ceramic-Adjustable-Thermostat/dp/B000TKDQ5C%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB000TKDQ5C</DetailPageURL>
                    <ProductGroup>Home</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B00FLYWNYQ</ASIN>
                    <Title>Instant Pot IP-DUO60 7-in-1 Programmable Pressure Cooker 6Qt/1000W, Stainless Steel Cooking Pot and Exterior</Title>
                    <DetailPageURL>http://www.amazon.com/Instant-Pot-IP-DUO60-Programmable-Stainless/dp/B00FLYWNYQ%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00FLYWNYQ</DetailPageURL>
                    <ProductGroup>Kitchen</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B00MVMCUK8</ASIN>
                    <Title>BlenderBottle Classic Loop Top Shaker Bottle, Clear Black, 28 Ounce</Title>
                    <DetailPageURL>http://www.amazon.com/BlenderBottle-Classic-Shaker-Bottle-Clear/dp/B00MVMCUK8%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00MVMCUK8</DetailPageURL>
                    <ProductGroup>Kitchen</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B00V9JP8EE</ASIN>
                    <Title>InnoGear® 100ml Aromatherapy Essential Oil Diffuser Portable Ultrasonic Cool Mist Aroma Humidifier with Color LED Lights Changing and Waterless Auto Shut-off Function for Home Office Bedroom Room</Title>
                    <DetailPageURL>http://www.amazon.com/InnoGear%C2%AE-Aromatherapy-Essential-Ultrasonic-Humidifier/dp/B00V9JP8EE%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00V9JP8EE</DetailPageURL>
                    <ProductGroup>Health and Beauty</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B006LXOJC0</ASIN>
                    <Title>BLACK + DECKER CHV1410L 16 volt Lithium Cordless Dust Buster Hand Vac</Title>
                    <DetailPageURL>http://www.amazon.com/BLACK-DECKER-CHV1410L-Lithium-Cordless/dp/B006LXOJC0%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB006LXOJC0</DetailPageURL>
                    <ProductGroup>Home</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B001CQTLJM</ASIN>
                    <Title>KitchenIQ 50009 Edge Grip 2 Stage Knife Sharpener</Title>
                    <DetailPageURL>http://www.amazon.com/KitchenIQ-50009-Stage-Knife-Sharpener/dp/B001CQTLJM%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB001CQTLJM</DetailPageURL>
                    <ProductGroup>Kitchen</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B003N1ZSYG</ASIN>
                    <Title>Samsung Da29-00020b Refrigerator Water Filter, 1-pack</Title>
                    <DetailPageURL>http://www.amazon.com/Samsung-Da29-00020b-Refrigerator-Filter-1-pack/dp/B003N1ZSYG%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB003N1ZSYG</DetailPageURL>
                    <ProductGroup>Home Improvement</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B002QAYJPO</ASIN>
                    <Title>Honeywell Germ Free Cool Mist Humidifier, HCM-350</Title>
                    <DetailPageURL>http://www.amazon.com/Honeywell-Germ-Free-Humidifier-HCM-350/dp/B002QAYJPO%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB002QAYJPO</DetailPageURL>
                    <ProductGroup>Home</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B001FWXKTA</ASIN>
                    <Title>Vicks Warm Mist Humidifier with Auto Shut-Off</Title>
                    <DetailPageURL>http://www.amazon.com/Vicks-Warm-Mist-Humidifier-Shut-Off/dp/B001FWXKTA%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB001FWXKTA</DetailPageURL>
                    <ProductGroup>Health and Beauty</ProductGroup>
                </TopItem>
                <TopItem>
                    <ASIN>B005KMDV9A</ASIN>
                    <Title>Shark Navigator Lift-Away Professional Upright (NV356E)</Title>
                    <DetailPageURL>http://www.amazon.com/Shark-Navigator-Lift-Away-Professional-NV356E/dp/B005KMDV9A%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB005KMDV9A</DetailPageURL>
                    <ProductGroup>Home</ProductGroup>
                </TopItem>
            </TopItemSet>
        </BrowseNode>
    </BrowseNodes>
</BrowseNodeLookupResponse>
    MOCK_XML
    http_client = OpenUriClient.new
    http_client.expects(:get).returns(mock_xml)
    xml_parser = NokogiriParser.new
    amazon_api = AmazonApi.new(http_client, xml_parser)
    browse_node_id = "02619526011"
    expected_result = %w{B000TKDQ5C B00FLYWNYQ B00MVMCUK8 B00V9JP8EE B006LXOJC0 B001CQTLJM B003N1ZSYG B002QAYJPO B001FWXKTA B005KMDV9A B000TKDQ5C B00FLYWNYQ B00MVMCUK8 B00V9JP8EE B006LXOJC0 B001CQTLJM B003N1ZSYG B002QAYJPO B001FWXKTA B005KMDV9A}
    parsed_item = amazon_api.call_browse_node_api(browse_node_id)
    parsed_result = parsed_item.map {|item| item.content}
    assert_equal expected_result, parsed_result
  
  end
  
end
