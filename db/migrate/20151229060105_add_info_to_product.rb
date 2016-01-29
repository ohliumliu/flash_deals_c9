class AddInfoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :detail_page_url, :string
    add_column :products, :manufacturer, :string
    add_column :products, :list_price, :float
    add_column :products, :title, :string
    add_column :products, :small_image_url, :string
    add_column :products, :medium_image_url, :string
    add_column :products, :price, :float
    add_column :products, :amount_saved, :float
    add_column :products, :percentage_saved, :float
    add_column :products, :is_supersaver_shipping, :boolean
    add_column :products, :is_prime, :boolean
    add_column :products, :ASIN, :string
  end
end
