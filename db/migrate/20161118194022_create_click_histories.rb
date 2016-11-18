class CreateClickHistories < ActiveRecord::Migration
  def change
    create_table :click_histories do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
