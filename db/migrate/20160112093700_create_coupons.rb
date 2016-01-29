class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :content, null:false
      t.timestamps null:false
    end
  end
end
