class CreateObstacles < ActiveRecord::Migration
  def change
    create_table :obstacles do |t|
      t.string :primary_skill, null:false
      t.string :secondary_skill
      t.integer :dc, null:false
      t.string :description
      t.integer :chase_id, null:false

      t.timestamps null: false
    end
  end
end
