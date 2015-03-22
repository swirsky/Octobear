class CreateCasters < ActiveRecord::Migration
  def change
    create_table :casters do |t|
      t.string :name
      t.integer :user_id
      t.integer :wins
      t.integer :losses
      t.integer :ties

      t.timestamps null: false
    end
  end
end
