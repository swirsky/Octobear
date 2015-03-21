class AddOrderToObstacles < ActiveRecord::Migration
  def change
    add_column :obstacles, :order, :integer
  end
end
