class AddIndexToProduct < ActiveRecord::Migration
  def change
    add_index :products, :ASIN, unique: true
  end
end
