class CreateProductClusters < ActiveRecord::Migration
  def change
    create_table :product_clusters do |t|
      t.integer :product_id
      t.integer :cluster

      t.timestamps null: false
    end
  end
end
