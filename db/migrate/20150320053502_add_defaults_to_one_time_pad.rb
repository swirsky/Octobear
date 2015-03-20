class AddDefaultsToOneTimePad < ActiveRecord::Migration
  def change
    change_column :one_time_pads, :key_length, :integer, default:25
    change_column :one_time_pads, :group_length, :integer, default:5
    change_column :one_time_pads, :line_length, :integer, default:25
  end
end
