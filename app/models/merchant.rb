class Merchant < ActiveRecord::Base
  has_many :products
  attr_accessible :name, :url
end
