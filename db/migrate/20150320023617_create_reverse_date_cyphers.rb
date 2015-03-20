class CreateReverseDateCyphers < ActiveRecord::Migration
  def change
    create_table :reverse_date_cyphers do |t|
      t.string :input, null:false
      t.integer :date_cypher, null:false
      t.string :output, null:false
      t.integer :user_id, null:false

      t.timestamps null: false
    end
  end
end
