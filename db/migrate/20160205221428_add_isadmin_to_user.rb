class AddIsadminToUser < ActiveRecord::Migration
  def change
    add_column :users, :isadmin, :boolean, default: false
  end
end
