class CreateVSquareCyphers < ActiveRecord::Migration
  def change
    create_table :v_square_cyphers do |t|
      t.string :input
      t.integer :user_id
      t.string :output
      t.string :codeword

      t.timestamps null: false
    end
  end
end
