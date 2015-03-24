class NoKeyWords < ActiveRecord::Migration
  def change
    rename_column :factions, :type, :main_type
  end
end
