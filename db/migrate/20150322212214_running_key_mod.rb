class RunningKeyMod < ActiveRecord::Migration
  def change
    rename_column :running_keys, :page, :page_number
  end
end
