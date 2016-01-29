class Product < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :catalog
  attr_accessible :description, :name, :catalog_id, :detail_page_url, :small_image_url, :medium_image_url, :list_price, :price, :amount_saved, :percentage_saved, :is_supersaver_shipping, :title, :merchant_id, :ASIN
end
