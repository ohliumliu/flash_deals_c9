class AddDealerIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :dealer_id, :integer
  end
end
