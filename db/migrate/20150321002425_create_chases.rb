class CreateChases < ActiveRecord::Migration
  def change
    create_table :chases do |t|
      t.string :name, null:false
      t.integer :cr, null:false
      t.integer :user_id, null:false
      t.string :description

      t.timestamps null: false
    end
  end
end
