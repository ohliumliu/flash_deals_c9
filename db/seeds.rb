# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CATALOGS = [{name: 'Appliances', url: '#', browse_node_id: '2619526011'},
            {name: 'Apps & Games', url: '#', browse_node_id: '2350150011'},
            {name: 'Automotive', url: '#', browse_node_id: '15690151'}]
            
Catalog.destroy_all
CATALOGS.each do |catalog|
  new_catalog = Catalog.new({name: catalog[:name], url: catalog[:url], browse_node_id: catalog[:browse_node_id]})
  new_catalog.save
end



Merchant.destroy_all

TravelSite.destroy_all
TravelSite.create({name: 'Priceline', url: 'http://www.priceline.com'})

Product.destroy_all
