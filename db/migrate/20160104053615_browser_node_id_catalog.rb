class BrowserNodeIdCatalog < ActiveRecord::Migration
  def change
  add_column :catalogs, :browse_node_id, :string
  end
end
