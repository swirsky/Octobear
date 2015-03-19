class AddUserIdToOtp < ActiveRecord::Migration
  def change
    add_column :one_time_pads, :user_id, :integer
  end
end
