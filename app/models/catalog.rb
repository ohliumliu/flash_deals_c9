class Catalog < ActiveRecord::Base
  has_many :products
  attr_accessible :name, :url, :browse_node_id
end
