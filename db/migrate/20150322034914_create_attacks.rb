class CreateAttacks < ActiveRecord::Migration
  def change
    create_table :attacks do |t|
      t.string :name
      t.string :type
      t.integer :damage
      t.string :effect
      t.integer :critchance
      t.integer :tohit

      t.timestamps null: false
    end
  end
end
