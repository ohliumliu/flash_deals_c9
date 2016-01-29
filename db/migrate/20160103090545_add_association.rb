class AddAssociation < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :merchant_id
      t.remove :catalog_id
      t.belongs_to :merchant, index: true
      t.belongs_to :catalog, index: true
    end
  end
end
