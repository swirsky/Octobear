class DefaultNumberOfKeys < ActiveRecord::Migration
  def change
    change_column :one_time_pads, :number_of_keys, :integer, default:1
  end
end
