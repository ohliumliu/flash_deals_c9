class UpdateProductColumns < ActiveRecord::Migration
  def change
    change_column :products, :list_price, :integer
    change_column :products, :price, :integer
    change_column :products, :amount_saved, :integer
    change_column :products, :percentage_saved, :integer
    add_column :products, :merchant_id, :integer
    add_column :products, :catalog_id, :integer
    	
  end

end
