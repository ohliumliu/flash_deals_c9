class Product < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :catalog
  belongs_to :dealer
  attr_accessible :description, :name, :dealer_id, :catalog_id, :detail_page_url, :small_image_url, :medium_image_url, :list_price, :price, :amount_saved, :percentage_saved, :is_supersaver_shipping, :title, :merchant_id, :ASIN
  validates :ASIN, uniqueness: true
  paginates_per 8
  
  def save_for_kmeans
    out_dir = "history/"
    out_str = "(" + self.id.to_s() + ")" + "[" + self.title + "]"
    out_file = File.new( out_dir + Time.now.getutc.to_i().to_s(), "w")
    out_file.write(out_str)
    out_file.close()
  end
end
