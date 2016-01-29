class CreateTravelSites < ActiveRecord::Migration
  def change
    create_table :travel_sites do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
