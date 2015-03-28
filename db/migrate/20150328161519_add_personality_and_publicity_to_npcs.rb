class AddPersonalityAndPublicityToNpcs < ActiveRecord::Migration
  def change
    add_column :npcs, :personality, :string
    add_column :npcs, :physical_description, :string
    add_column :npcs, :publicity, :string
  end
end
