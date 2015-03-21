class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :book_id, null:false
      t.integer :page_number, null:false
      t.integer :line_length, null:false, default:50
      t.string :text, null:false

      t.timestamps null: false
    end
  end
end
