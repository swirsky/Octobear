class CreateTranspositionCiphers < ActiveRecord::Migration
  def change
    create_table :transposition_ciphers do |t|
      t.string :input, null:false
      t.integer :user_id, null:false
      t.string :keyword, null:false
      t.string :output, null:false

      t.timestamps null: false
    end
  end
end
