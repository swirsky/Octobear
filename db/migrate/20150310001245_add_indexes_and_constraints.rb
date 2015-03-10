class AddIndexesAndConstraints < ActiveRecord::Migration
  def change
    change_column :links, :url, :string, null: false
    add_index :links, :slug, :unique => true
  end
end
