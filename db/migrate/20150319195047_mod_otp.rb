class ModOtp < ActiveRecord::Migration
  def change
    change_column :one_time_pads, :user_id, :integer, null:false
    add_index :one_time_pads, :user_id
  end
end
