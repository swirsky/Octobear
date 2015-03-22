class CreateSummonedCreatures < ActiveRecord::Migration
  def change
    create_table :summoned_creatures do |t|
      t.string :name
      t.integer :caster_id
      t.string :type
      t.integer :hp
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :intel
      t.integer :wis
      t.integer :cha
      t.string :weak_against
      t.string :resistant_against

      t.timestamps null: false
    end
  end
end
