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
  
  test "test_call_item_lookup_api" do
    mock_xml = <<-MOCK_XML
    <?xml version="1.0" ?>
<ItemLookupResponse
    xmlns="http://webservices.amazon.com/AWSECommerceService/2011-08-01">
    <OperationRequest>
        <HTTPHeaders>
            <Header Name="UserAgent" Value="Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:44.0) Gecko/20100101 Firefox/44.0"></Header>
        </HTTPHeaders>
        <RequestId>fe6e887f-8a0b-41fa-88b2-73cfeaf8effa</RequestId>
        <Arguments>
            <Argument Name="AWSAccessKeyId" Value="AKIAJOWJPSCFZWOSUDAQ"></Argument>
            <Argument Name="AssociateTag" Value="dealsoutlet04-20"></Argument>
            <Argument Name="IdType" Value="ASIN"></Argument>
            <Argument Name="ItemId" Value="B00V9JP8EE"></Argument>
            <Argument Name="Operation" Value="ItemLookup"></Argument>
            <Argument Name="ResponseGroup" Value="Large,PromotionSummary"></Argument>
            <Argument Name="Service" Value="AWSECommerceService"></Argument>
            <Argument Name="Timestamp" Value="2016-02-18T06:02:39.000Z"></Argument>
            <Argument Name="Signature" Value="UXh1DJT7Ijm1YM9rbDDFJTUh03T95MnjHNstjhcgKBU="></Argument>
        </Arguments>
        <RequestProcessingTime>0.0489110000000000</RequestProcessingTime>
    </OperationRequest>
    <Items>
        <Request>
            <IsValid>True</IsValid>
            <ItemLookupRequest>
                <IdType>ASIN</IdType>
                <ItemId>B00V9JP8EE</ItemId>
                <ResponseGroup>Large</ResponseGroup>
                <ResponseGroup>PromotionSummary</ResponseGroup>
                <VariationPage>All</VariationPage>
            </ItemLookupRequest>
        </Request>
        <Item>
            <ASIN>B00V9JP8EE</ASIN>
            <ParentASIN>B0140ZPXR0</ParentASIN>
            <DetailPageURL>http://www.amazon.com/InnoGear%C2%AE-Aromatherapy-Essential-Ultrasonic-Humidifier/dp/B00V9JP8EE%3Fpsc%3D1%26SubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00V9JP8EE</DetailPageURL>
            <ItemLinks>
                <ItemLink>
                    <Description>Technical Details</Description>
                    <URL>http://www.amazon.com/InnoGear%C2%AE-Aromatherapy-Essential-Ultrasonic-Humidifier/dp/tech-data/B00V9JP8EE%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
                <ItemLink>
                    <Description>Add To Baby Registry</Description>
                    <URL>http://www.amazon.com/gp/registry/baby/add-item.html%3Fasin.0%3DB00V9JP8EE%26SubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
                <ItemLink>
                    <Description>Add To Wedding Registry</Description>
                    <URL>http://www.amazon.com/gp/registry/wedding/add-item.html%3Fasin.0%3DB00V9JP8EE%26SubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
                <ItemLink>
                    <Description>Add To Wishlist</Description>
                    <URL>http://www.amazon.com/gp/registry/wishlist/add-item.html%3Fasin.0%3DB00V9JP8EE%26SubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
                <ItemLink>
                    <Description>Tell A Friend</Description>
                    <URL>http://www.amazon.com/gp/pdp/taf/B00V9JP8EE%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
                <ItemLink>
                    <Description>All Customer Reviews</Description>
                    <URL>http://www.amazon.com/review/product/B00V9JP8EE%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
                <ItemLink>
                    <Description>All Offers</Description>
                    <URL>http://www.amazon.com/gp/offer-listing/B00V9JP8EE%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</URL>
                </ItemLink>
            </ItemLinks>
            <SalesRank>39</SalesRank>
            <SmallImage>
                <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL75_.jpg</URL>
                <Height Units="pixels">75</Height>
                <Width Units="pixels">75</Width>
            </SmallImage>
            <MediumImage>
                <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL160_.jpg</URL>
                <Height Units="pixels">160</Height>
                <Width Units="pixels">160</Width>
            </MediumImage>
            <LargeImage>
                <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL.jpg</URL>
                <Height Units="pixels">500</Height>
                <Width Units="pixels">500</Width>
            </LargeImage>
            <ImageSets>
                <ImageSet Category="variant">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/41voSXdUR8L._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/41voSXdUR8L._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/41voSXdUR8L._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/41voSXdUR8L._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/41voSXdUR8L._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/41voSXdUR8L.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
                <ImageSet Category="variant">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/414flHZhluL._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/414flHZhluL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/414flHZhluL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/414flHZhluL._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/414flHZhluL._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/414flHZhluL.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
                <ImageSet Category="variant">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/41SQJkbNg9L._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/41SQJkbNg9L._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/41SQJkbNg9L._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/41SQJkbNg9L._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/41SQJkbNg9L._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/41SQJkbNg9L.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
                <ImageSet Category="variant">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/513HtGvE-BL._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/513HtGvE-BL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/513HtGvE-BL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/513HtGvE-BL._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/513HtGvE-BL._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/513HtGvE-BL.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
                <ImageSet Category="variant">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/51FiYCpwLrL._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/51FiYCpwLrL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/51FiYCpwLrL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/51FiYCpwLrL._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/51FiYCpwLrL._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/51FiYCpwLrL.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
                <ImageSet Category="variant">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/41TPdNbDycL._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/41TPdNbDycL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/41TPdNbDycL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/41TPdNbDycL._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/41TPdNbDycL._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/41TPdNbDycL.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
                <ImageSet Category="primary">
                    <SwatchImage>
                        <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL30_.jpg</URL>
                        <Height Units="pixels">30</Height>
                        <Width Units="pixels">30</Width>
                    </SwatchImage>
                    <SmallImage>
                        <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </SmallImage>
                    <ThumbnailImage>
                        <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL75_.jpg</URL>
                        <Height Units="pixels">75</Height>
                        <Width Units="pixels">75</Width>
                    </ThumbnailImage>
                    <TinyImage>
                        <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL110_.jpg</URL>
                        <Height Units="pixels">110</Height>
                        <Width Units="pixels">110</Width>
                    </TinyImage>
                    <MediumImage>
                        <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL160_.jpg</URL>
                        <Height Units="pixels">160</Height>
                        <Width Units="pixels">160</Width>
                    </MediumImage>
                    <LargeImage>
                        <URL>http://ecx.images-amazon.com/images/I/31IkV9cfmbL.jpg</URL>
                        <Height Units="pixels">500</Height>
                        <Width Units="pixels">500</Width>
                    </LargeImage>
                </ImageSet>
            </ImageSets>
            <ItemAttributes>
                <Binding>Kitchen</Binding>
                <Brand>InnoGear</Brand>
                <Color>100ml White</Color>
                <EAN>0702168720690</EAN>
                <EANList>
                    <EANListElement>0702168720690</EANListElement>
                </EANList>
                <Feature>It fills the space with a lovely fragrance that can lift the mood and relieve stress from stressful and tired day, perfect for masking stubborn smoking and pet odors, get great and peaceful nights' sleep surrounded by the aromatic fragrance.</Feature>
                <Feature>Whisper-Quiet Ultrasonic Operation - humidify your living space to prevent dry, stuffy air and flu/cold germs infecting your loved ones. Prevent dry and chapped skin in dry winter months.</Feature>
                <Feature>Spark Your Kid's Imagination with 7 Changing Mood Lights, each of which is adjustable between Bright and Dim modes, and could be set steady on. Great night light for young children scared of the dark at bedtime. Color including: Green, Dark blue, Red, Yellow, Pink, Light blue, White.</Feature>
                <Feature>Shuts Off Automatically When The Water Runs Out. Portable for Home, Yoga, Office, Spa, Bedroom, Baby Room. Perfect gift idea for family and friends who love aromatherapy or can benefit from Aromatherapy healing.</Feature>
                <Feature>Three Working Modes: Intermittent Mist(30 seconds on/30 seconds off), Continuous Mist, Lights only. Content: 100 ml, Extra Long Power Cord: 6 feet, Item Size: 3.9 * 5.7in Weight: 11oz. Material: PP Hard Plastic, Working Time: 3 hours in continuous mode, 6 hours in intermittent mode</Feature>
                <ItemDimensions>
                    <Height Units="hundredths-inches">394</Height>
                    <Length Units="hundredths-inches">394</Length>
                    <Weight Units="hundredths-pounds">44</Weight>
                    <Width Units="hundredths-inches">551</Width>
                </ItemDimensions>
                <Label>InnoGear</Label>
                <ListPrice>
                    <Amount>4999</Amount>
                    <CurrencyCode>USD</CurrencyCode>
                    <FormattedPrice>$49.99</FormattedPrice>
                </ListPrice>
                <Manufacturer>InnoGear</Manufacturer>
                <Model>MT-039</Model>
                <MPN>MT-039</MPN>
                <PackageDimensions>
                    <Height Units="hundredths-inches">440</Height>
                    <Length Units="hundredths-inches">770</Length>
                    <Weight Units="hundredths-pounds">95</Weight>
                    <Width Units="hundredths-inches">450</Width>
                </PackageDimensions>
                <PackageQuantity>1</PackageQuantity>
                <PartNumber>MT-039</PartNumber>
                <ProductGroup>Health and Beauty</ProductGroup>
                <ProductTypeName>HOME</ProductTypeName>
                <Publisher>InnoGear</Publisher>
                <Studio>InnoGear</Studio>
                <Title>InnoGear® 100ml Aromatherapy Essential Oil Diffuser Portable Ultrasonic Cool Mist Aroma Humidifier with Color LED Lights Changing and Waterless Auto Shut-off Function for Home Office Bedroom Room</Title>
                <UPC>702168720690</UPC>
                <UPCList>
                    <UPCListElement>702168720690</UPCListElement>
                </UPCList>
            </ItemAttributes>
            <OfferSummary>
                <LowestNewPrice>
                    <Amount>2395</Amount>
                    <CurrencyCode>USD</CurrencyCode>
                    <FormattedPrice>$23.95</FormattedPrice>
                </LowestNewPrice>
                <TotalNew>1</TotalNew>
                <TotalUsed>0</TotalUsed>
                <TotalCollectible>0</TotalCollectible>
                <TotalRefurbished>0</TotalRefurbished>
            </OfferSummary>
            <Offers>
                <TotalOffers>1</TotalOffers>
                <TotalOfferPages>1</TotalOfferPages>
                <MoreOffersUrl>http://www.amazon.com/gp/offer-listing/B00V9JP8EE%3FSubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D386001%26creativeASIN%3DB00V9JP8EE</MoreOffersUrl>
                <Offer>
                    <OfferAttributes>
                        <Condition>New</Condition>
                    </OfferAttributes>
                    <OfferListing>
                        <OfferListingId>cPhm3rrLAOj4238JARssw5DsSybvTmoaTWGWSUl8rXCzho9q%2Bey4AK7VCIKZDtp69ixRpYEDqe5w%2BRujI4SdeUXXi%2Fh4EVELaZ1D%2F7O1RsB%2FbgXeYkpUBo0oFUd3TSzQc9jpjVrcuwaXpRO5h5jFehs6LH%2BQiEKh</OfferListingId>
                        <Price>
                            <Amount>6999</Amount>
                            <CurrencyCode>USD</CurrencyCode>
                            <FormattedPrice>$69.99</FormattedPrice>
                        </Price>
                        <SalePrice>
                            <Amount>2395</Amount>
                            <CurrencyCode>USD</CurrencyCode>
                            <FormattedPrice>$23.95</FormattedPrice>
                        </SalePrice>
                        <AmountSaved>
                            <Amount>4604</Amount>
                            <CurrencyCode>USD</CurrencyCode>
                            <FormattedPrice>$46.04</FormattedPrice>
                        </AmountSaved>
                        <PercentageSaved>66</PercentageSaved>
                        <Availability>Usually ships in 24 hours</Availability>
                        <AvailabilityAttributes>
                            <AvailabilityType>now</AvailabilityType>
                            <MinimumHours>0</MinimumHours>
                            <MaximumHours>0</MaximumHours>
                        </AvailabilityAttributes>
                        <IsEligibleForSuperSaverShipping>0</IsEligibleForSuperSaverShipping>
                        <IsEligibleForPrime>1</IsEligibleForPrime>
                    </OfferListing>
                    <Promotions>
                        <Promotion>
                            <Summary>
                                <PromotionId>A1V7T4ITN2V5DE</PromotionId>
                                <Category>BuyQuantityXGetAmountOffX</Category>
                                <EligibilityRequirementDescription>Save $7.00 with this coupon. Enter code 4JFJ2TVW at checkout.</EligibilityRequirementDescription>
                                <BenefitDescription>Save $7.00 with this coupon. Enter code 4JFJ2TVW at checkout.</BenefitDescription>
                                <TermsAndConditions>
                                    <strong>To receive the Best Value discount:</strong>
                                    <ol>
                                        <li>Add all products described in the promotion to your Shopping Cart in one of two ways:</li>
                                        <ul>
                                            <li>Via the “Add both to Cart” button in the promotion description, OR</li>
                                            <li>Via the “Add to Shopping Cart” button on each respective product information page.</li>
                                        </ul>
                                        <li>The amount of the Best Value discount will be reflected on the final order checkout page and will be allocated proportionally to all promotion items in the Shopping Cart, including the Best Value item itself. For example, if the promotion offers $5 off one item worth $10 when you purchase two qualifying items worth $20 each, the $5 will be divided proportionately between the three items, so that the Best Value item will appear with a $1 discount, and each of the two other qualifying items will appear with a $2 discount.</li>
                                    </ol>
                                    <strong>Terms and Conditions:</strong>
                                    <ul>
                                        <li>The promotion is valid for a limited time only. Amazon reserves the right to cancel it at any time.</li>
                                        <li>If you do not purchase the qualifying and Best Value items added to your Shopping Cart when the promotion is in effect, the discount will not apply.</li>
                                        <li>The promotion applies only to qualifying items displaying the offer message on their product information pages.</li>
                                        <li>The promotion applies only to products sold by the seller indicated in the offer message. It does not apply to the same products sold by other sellers. For example, if the promotion applies to cookware offered by Amazon.com, the same cookware offered by other sellers on the Amazon.com website (e.g. Macy’s, etc.) do not qualify.</li>
                                        <li>Unless the promotion indicates otherwise, it applies to the lowest priced qualifying item and may not be combined with other offers.</li>
                                        <li>All qualifying and Best Value items must be purchased in one order and shipped to a single address.</li>
                                        <li>If you return any of the promotion items, we will subtract your Best Value discount from your return credit.</li>
                                        <li>Shipping and handling charges apply to all products, including Best Value items.</li>
                                        <li>Add-on Items require a minimum purchase. See amazon.com/addon for details.</li>
                                        <li>This promotion may not be combined with other offers, including promotional certificates.</li>
                                        <li>Does not apply to orders placed with 1-Click.</li>
                                        <li>Offer good while supplies last.</li>
                                        <li>Void where prohibited.</li>
                                        <li>If you remove any of the promotion items from your Shopping Cart or violate any of the Terms and Conditions, the promotion will be invalid, and the discount will not apply.</li>
                                    </ul>
                                </TermsAndConditions>
                            </Summary>
                        </Promotion>
                        <Promotion>
                            <Summary>
                                <PromotionId>A2RV74N1C1X2KR</PromotionId>
                                <Category>BuyQuantityXGetAmountOffX</Category>
                                <EligibilityRequirementDescription>Save $5.00 with this coupon. Enter code 53JJG3CQ at checkout.</EligibilityRequirementDescription>
                                <BenefitDescription>Save $5.00 with this coupon. Enter code 53JJG3CQ at checkout.</BenefitDescription>
                                <TermsAndConditions>
                                    <strong>To receive the Best Value discount:</strong>
                                    <ol>
                                        <li>Add all products described in the promotion to your Shopping Cart in one of two ways:</li>
                                        <ul>
                                            <li>Via the “Add both to Cart” button in the promotion description, OR</li>
                                            <li>Via the “Add to Shopping Cart” button on each respective product information page.</li>
                                        </ul>
                                        <li>The amount of the Best Value discount will be reflected on the final order checkout page and will be allocated proportionally to all promotion items in the Shopping Cart, including the Best Value item itself. For example, if the promotion offers $5 off one item worth $10 when you purchase two qualifying items worth $20 each, the $5 will be divided proportionately between the three items, so that the Best Value item will appear with a $1 discount, and each of the two other qualifying items will appear with a $2 discount.</li>
                                    </ol>
                                    <strong>Terms and Conditions:</strong>
                                    <ul>
                                        <li>The promotion is valid for a limited time only. Amazon reserves the right to cancel it at any time.</li>
                                        <li>If you do not purchase the qualifying and Best Value items added to your Shopping Cart when the promotion is in effect, the discount will not apply.</li>
                                        <li>The promotion applies only to qualifying items displaying the offer message on their product information pages.</li>
                                        <li>The promotion applies only to products sold by the seller indicated in the offer message. It does not apply to the same products sold by other sellers. For example, if the promotion applies to cookware offered by Amazon.com, the same cookware offered by other sellers on the Amazon.com website (e.g. Macy’s, etc.) do not qualify.</li>
                                        <li>Unless the promotion indicates otherwise, it applies to the lowest priced qualifying item and may not be combined with other offers.</li>
                                        <li>All qualifying and Best Value items must be purchased in one order and shipped to a single address.</li>
                                        <li>If you return any of the promotion items, we will subtract your Best Value discount from your return credit.</li>
                                        <li>Shipping and handling charges apply to all products, including Best Value items.</li>
                                        <li>Add-on Items require a minimum purchase. See amazon.com/addon for details.</li>
                                        <li>This promotion may not be combined with other offers, including promotional certificates.</li>
                                        <li>Does not apply to orders placed with 1-Click.</li>
                                        <li>Offer good while supplies last.</li>
                                        <li>Void where prohibited.</li>
                                        <li>If you remove any of the promotion items from your Shopping Cart or violate any of the Terms and Conditions, the promotion will be invalid, and the discount will not apply.</li>
                                    </ul>
                                </TermsAndConditions>
                            </Summary>
                        </Promotion>
                        <Promotion>
                            <Summary>
                                <PromotionId>A3HDA5HF1ZWKZU</PromotionId>
                                <Category>BuyQuantityXGetAmountOffX</Category>
                                <EligibilityRequirementDescription>Save $3.00 with this coupon. Enter code HPWAZ677 at checkout.</EligibilityRequirementDescription>
                                <BenefitDescription>Save $3.00 with this coupon. Enter code HPWAZ677 at checkout.</BenefitDescription>
                                <TermsAndConditions>
                                    <strong>To receive the Best Value discount:</strong>
                                    <ol>
                                        <li>Add all products described in the promotion to your Shopping Cart in one of two ways:</li>
                                        <ul>
                                            <li>Via the “Add both to Cart” button in the promotion description, OR</li>
                                            <li>Via the “Add to Shopping Cart” button on each respective product information page.</li>
                                        </ul>
                                        <li>The amount of the Best Value discount will be reflected on the final order checkout page and will be allocated proportionally to all promotion items in the Shopping Cart, including the Best Value item itself. For example, if the promotion offers $5 off one item worth $10 when you purchase two qualifying items worth $20 each, the $5 will be divided proportionately between the three items, so that the Best Value item will appear with a $1 discount, and each of the two other qualifying items will appear with a $2 discount.</li>
                                    </ol>
                                    <strong>Terms and Conditions:</strong>
                                    <ul>
                                        <li>The promotion is valid for a limited time only. Amazon reserves the right to cancel it at any time.</li>
                                        <li>If you do not purchase the qualifying and Best Value items added to your Shopping Cart when the promotion is in effect, the discount will not apply.</li>
                                        <li>The promotion applies only to qualifying items displaying the offer message on their product information pages.</li>
                                        <li>The promotion applies only to products sold by the seller indicated in the offer message. It does not apply to the same products sold by other sellers. For example, if the promotion applies to cookware offered by Amazon.com, the same cookware offered by other sellers on the Amazon.com website (e.g. Macy’s, etc.) do not qualify.</li>
                                        <li>Unless the promotion indicates otherwise, it applies to the lowest priced qualifying item and may not be combined with other offers.</li>
                                        <li>All qualifying and Best Value items must be purchased in one order and shipped to a single address.</li>
                                        <li>If you return any of the promotion items, we will subtract your Best Value discount from your return credit.</li>
                                        <li>Shipping and handling charges apply to all products, including Best Value items.</li>
                                        <li>Add-on Items require a minimum purchase. See amazon.com/addon for details.</li>
                                        <li>This promotion may not be combined with other offers, including promotional certificates.</li>
                                        <li>Does not apply to orders placed with 1-Click.</li>
                                        <li>Offer good while supplies last.</li>
                                        <li>Void where prohibited.</li>
                                        <li>If you remove any of the promotion items from your Shopping Cart or violate any of the Terms and Conditions, the promotion will be invalid, and the discount will not apply.</li>
                                    </ul>
                                </TermsAndConditions>
                            </Summary>
                        </Promotion>
                    </Promotions>
                </Offer>
            </Offers>
            <CustomerReviews>
                <IFrameURL>http://www.amazon.com/reviews/iframe?akid=AKIAJOWJPSCFZWOSUDAQ&alinkCode=xm2&asin=B00V9JP8EE&atag=dealsoutlet04-20&exp=2016-02-19T06%3A02%3A41Z&v=2&sig=5RkM%2Bxmb49b3kwQh4%2FZZDk7XH29C6vowraJYUszl7WI%3D</IFrameURL>
                <HasReviews>true</HasReviews>
            </CustomerReviews>
            <EditorialReviews>
                <EditorialReview>
                    <Source>Product Description</Source>
                    <Content>InnoGear® diffusers are guaranteed to give 100% satisfaction in every way. We stand behind everything we sell. Return anything purchased from us at any time if it proves otherwise. We do not want you to have anything from InnGear® that is not completely satisfactory. 

                        <br>
                            <br>
                                <br>This is perfect for small to medium sized rooms. Keeping your living space humid helps prevent colds/flu and congestion. 

                                    <br>
                                        <br>Hit the light button to transforms through 7 colors like a rainbow or stays on the color of your choice. 

                                            <br>
                                                <br>
                                                    <b> Features: </b>
                                                    <br>Three Settings toggled by the Mist button (Green/Red/Off): 

                                                        <br>* Green - intermittent mist (Mist 30 seconds and Pause 30 seconds) 

                                                            <br>* Red - continuous mist 

                                                                <br>* Off - You may use it as a color changing light without mist 

                                                                    <br>Auto shut off when water runs out. 

                                                                        <br>Keep essential oil 100% natural without burning or heating. 

                                                                            <br>
                                                                                <b> Please add water below the Max line</b>
                                                                                <br>
                                                                                    <br>
                                                                                        <b> Specifications: </b>
                                                                                        <br>Material: Upper parts PP 

                                                                                            <br>Capacity of water tank: About 100ml 

                                                                                                <br>Noise Level: less than 35 dB 

                                                                                                    <br>Input Power: AC 100-240V 50/60HZ 

                                                                                                        <br>Most advanced ultrasonic technology: 2.4MHz 

                                                                                                            <br>Working time: 3 hrs continuous mode, 6 hrs intermittent mode 

                                                                                                                <br>
                                                                                                                    <br>
                                                                                                                        <b> Package Contents: </b>
                                                                                                                        <br>1 x Aroma Diffuser 

                                                                                                                            <br>1 x Wall Charger 

                                                                                                                                <br>1 x Measuring Cup for Filling Water 

                                                                                                                                    <br>1 x User Manual 

                                                                                                                                        <br>*45 Days Money Back and 18 Months Warranty 

                                                                                                                                            <br>
                                                                                                                                                <b> Note: </b> Oil is not included in this package 

                                                                                                                                                <br>
                                                                                                                                                </Content>
                                                                                                                                                <IsLinkSuppressed>0</IsLinkSuppressed>
                                                                                                                                            </EditorialReview>
                                                                                                                                        </EditorialReviews>
                                                                                                                                        <SimilarProducts>
                                                                                                                                            <SimilarProduct>
                                                                                                                                                <ASIN>B0163GBZK8</ASIN>
                                                                                                                                                <Title>Aromatherapy Top 6 Essential Oils 100% Pure & Therapeutic grade - Basic Sampler Gift Set & Premium Kit - 6/10 Ml (Lavender, Tea Tree, Eucalyptus, Lemongrass, Orange, Peppermint)</Title>
                                                                                                                                            </SimilarProduct>
                                                                                                                                            <SimilarProduct>
                                                                                                                                                <ASIN>B005IHJ556</ASIN>
                                                                                                                                                <Title>Kis Oil'S Top 6 Therapeutic Grade Essential Oil Gift Set, 10 ml (Lavender, Tea Tree, Eucalyptus, Lemongrass, Orange, Peppermint)</Title>
                                                                                                                                            </SimilarProduct>
                                                                                                                                            <SimilarProduct>
                                                                                                                                                <ASIN>B00SA5UWW8</ASIN>
                                                                                                                                                <Title>Healing Solutions Therapeutic Grade Breathe, Good Night, Head Ease, Muscle Relief, Stress Relief, and Health Shield Essential Oils, 10ml, Set of 6</Title>
                                                                                                                                            </SimilarProduct>
                                                                                                                                            <SimilarProduct>
                                                                                                                                                <ASIN>B00QXVNSE0</ASIN>
                                                                                                                                                <Title>Good Night Essential Oil (Comparable to DoTerra's Serenity & Young Living's Peace & Calming Blend) 100% Pure, Best Therapeutic Grade - 10ml - Includes Chamomile, Copaiba, Lavender, Sandalwood & More</Title>
                                                                                                                                            </SimilarProduct>
                                                                                                                                            <SimilarProduct>
                                                                                                                                                <ASIN>B002RT09E4</ASIN>
                                                                                                                                                <Title>Breathe Easier Synergy Blend Essential Oil by Edens Garden (Peppermint, Rosemary, Lemon & Eucalyptus)- 10 ml</Title>
                                                                                                                                            </SimilarProduct>
                                                                                                                                        </SimilarProducts>
                                                                                                                                        <BrowseNodes>
                                                                                                                                            <BrowseNode>
                                                                                                                                                <BrowseNodeId>13900821</BrowseNodeId>
                                                                                                                                                <Name>Kitchen & Dining Features</Name>
                                                                                                                                                <Children>
                                                                                                                                                    <BrowseNode>
                                                                                                                                                        <BrowseNodeId>51552011</BrowseNodeId>
                                                                                                                                                        <Name>Featured Categories</Name>
                                                                                                                                                    </BrowseNode>
                                                                                                                                                </Children>
                                                                                                                                                <Ancestors>
                                                                                                                                                    <BrowseNode>
                                                                                                                                                        <BrowseNodeId>1055398</BrowseNodeId>
                                                                                                                                                        <Name>Home & Kitchen</Name>
                                                                                                                                                    </BrowseNode>
                                                                                                                                                </Ancestors>
                                                                                                                                            </BrowseNode>
                                                                                                                                            <BrowseNode>
                                                                                                                                                <BrowseNodeId>3737531</BrowseNodeId>
                                                                                                                                                <Name>Chemicals</Name>
                                                                                                                                                <Ancestors>
                                                                                                                                                    <BrowseNode>
                                                                                                                                                        <BrowseNodeId>3737511</BrowseNodeId>
                                                                                                                                                        <Name>Humidifier Parts & Accessories</Name>
                                                                                                                                                        <Ancestors>
                                                                                                                                                            <BrowseNode>
                                                                                                                                                                <BrowseNodeId>3741181</BrowseNodeId>
                                                                                                                                                                <Name>Parts & Accessories</Name>
                                                                                                                                                                <Ancestors>
                                                                                                                                                                    <BrowseNode>
                                                                                                                                                                        <BrowseNodeId>2619526011</BrowseNodeId>
                                                                                                                                                                        <Name>Categories</Name>
                                                                                                                                                                        <IsCategoryRoot>1</IsCategoryRoot>
                                                                                                                                                                        <Ancestors>
                                                                                                                                                                            <BrowseNode>
                                                                                                                                                                                <BrowseNodeId>2619525011</BrowseNodeId>
                                                                                                                                                                                <Name>Appliances</Name>
                                                                                                                                                                            </BrowseNode>
                                                                                                                                                                        </Ancestors>
                                                                                                                                                                    </BrowseNode>
                                                                                                                                                                </Ancestors>
                                                                                                                                                            </BrowseNode>
                                                                                                                                                        </Ancestors>
                                                                                                                                                    </BrowseNode>
                                                                                                                                                </Ancestors>
                                                                                                                                            </BrowseNode>
                                                                                                                                            <BrowseNode>
                                                                                                                                                <BrowseNodeId>9425857011</BrowseNodeId>
                                                                                                                                                <Name>Accessories</Name>
                                                                                                                                                <Ancestors>
                                                                                                                                                    <BrowseNode>
                                                                                                                                                        <BrowseNodeId>3737511</BrowseNodeId>
                                                                                                                                                        <Name>Humidifier Parts & Accessories</Name>
                                                                                                                                                        <Ancestors>
                                                                                                                                                            <BrowseNode>
                                                                                                                                                                <BrowseNodeId>3741181</BrowseNodeId>
                                                                                                                                                                <Name>Parts & Accessories</Name>
                                                                                                                                                                <Ancestors>
                                                                                                                                                                    <BrowseNode>
                                                                                                                                                                        <BrowseNodeId>2619526011</BrowseNodeId>
                                                                                                                                                                        <Name>Categories</Name>
                                                                                                                                                                        <IsCategoryRoot>1</IsCategoryRoot>
                                                                                                                                                                        <Ancestors>
                                                                                                                                                                            <BrowseNode>
                                                                                                                                                                                <BrowseNodeId>2619525011</BrowseNodeId>
                                                                                                                                                                                <Name>Appliances</Name>
                                                                                                                                                                            </BrowseNode>
                                                                                                                                                                        </Ancestors>
                                                                                                                                                                    </BrowseNode>
                                                                                                                                                                </Ancestors>
                                                                                                                                                            </BrowseNode>
                                                                                                                                                        </Ancestors>
                                                                                                                                                    </BrowseNode>
                                                                                                                                                </Ancestors>
                                                                                                                                            </BrowseNode>
                                                                                                                                        </BrowseNodes>
                                                                                                                                    </Item>
                                                                                                                                </Items>
                                                                                                                            </ItemLookupResponse>
    MOCK_XML
    ASIN = "B00V9JP8EE" 
    expected_product = Product.new
    expected_product[:ASIN] = ASIN 
    expected_product[:detail_page_url]="http://www.amazon.com/InnoGear%C2%AE-Aromatherapy-Essential-Ultrasonic-Humidifier/dp/B00V9JP8EE%3Fpsc%3D1%26SubscriptionId%3DAKIAJOWJPSCFZWOSUDAQ%26tag%3Ddealsoutlet04-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00V9JP8EE"
    expected_product[:small_image_url]="http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL75_.jpg"
    expected_product[:medium_image_url]="http://ecx.images-amazon.com/images/I/31IkV9cfmbL._SL160_.jpg"
    expected_product[:list_price]=4999
    expected_product[:price]=6999
    expected_product[:amount_saved]=4604
    expected_product[:percentage_saved]=66
    expected_product[:is_supersaver_shipping]=false
    expected_product[:title]="InnoGear® 100ml Aromatherapy Essential Oil Diffuser Portable Ultrasonic Cool Mist Aroma Humidifier with Color LED Lights Changing and Waterless Auto Shut-off Function for Home Office Bedroom Room"
    # set up Merchant entry for this particular test
    Merchant.new(name: "InnoGear").save
    expected_product[:merchant_id] = Merchant.last.id
    
    http_client = OpenUriClient.new
    http_client.expects(:get).returns(mock_xml)
    xml_parser = NokogiriParser.new
    amazon_api = AmazonApi.new(http_client, xml_parser)
    parsed_product_hash = amazon_api.call_item_lookup_api(ASIN)
    
    #ActiveRecord automatically converts 0 to false, but in ruby 0 is true. This test step suggests that it 
    #may be a good idea to do the conversion explicitly in the method.
    parsed_product_hash[:is_supersaver_shipping] = ActiveRecord::Type::Boolean.new.type_cast_from_database(parsed_product_hash[:is_supersaver_shipping])
    parsed_product_hash.each {|key, value|
        assert_equal expected_product[key],  value
    }
  end
  
end
