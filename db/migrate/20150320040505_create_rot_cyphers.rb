class CreateRotCyphers < ActiveRecord::Migration
  def change
    create_table :rot_cyphers do |t|
      t.string :input, null:false
      t.integer :user_id, null:false
      t.integer :rot, default:12, null:false
      t.string :output, null:false

      t.timestamps null: false
    end
  end
end
