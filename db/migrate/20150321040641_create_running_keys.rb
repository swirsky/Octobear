class CreateRunningKeys < ActiveRecord::Migration
  def change
    create_table :running_keys do |t|
      t.integer :user_id, null:false
      t.integer :book_id, null:false
      t.integer :group_length, null:false, default:5
      t.string :input, null:false, default:""
      t.string :indicator_block, null:false
      t.string :output, null:false
      t.integer :page, null:false
      t.integer :line, null:false
      t.string :key, null:false

      t.timestamps null: false
    end
  end
end
