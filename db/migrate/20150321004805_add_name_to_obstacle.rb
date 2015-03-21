class AddNameToObstacle < ActiveRecord::Migration
  def change
    add_column :obstacles, :name, :string
  end
end
