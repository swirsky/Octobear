class CreateOneTimePads < ActiveRecord::Migration
  def change
    create_table :one_time_pads do |t|
      t.string :input, null:false
      t.string :cypher, null:false
      t.string :output, null:false
      t.integer :line_length, default:25, null:false
      t.integer :group_length, default:5, null:false
      t.integer :number_of_keys, null:false
      t.integer :key_length, default:25, null:false
      t.bigint :seed, null:false

      t.timestamps null: false
    end
  end
end
