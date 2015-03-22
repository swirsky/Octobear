class AddPageToRunningCipher < ActiveRecord::Migration
  def change
    add_column :running_keys, :page_id, :integer
  end
end
