class AddDefaultsForSummons < ActiveRecord::Migration
  def change
    change_table :summoned_creatures do |t|
      t.change :name, :string, null:false
      t.change :caster_id, :integer, null:false
      t.change :type, :string, null:false
      t.change :hp, :integer, null:false
      t.change :str, :integer, null:false
      t.change :dex, :integer, null:false
      t.change :con, :integer, null:false
      t.change :intel, :integer, null:false
      t.change :wis, :integer, null:false
      t.change :cha, :integer, null:false
      t.change :weak_against, :string, null:false
      t.change :resistant_against, :string, null:false
      t.integer :experience, null:false, default:0
      t.integer :level, null:false, default:1
    end

    change_table :casters do |t|
      t.change :name, :string, null:false
      t.change :user_id, :integer, null:false
      t.change :wins, :integer, null:false, default:0
      t.change :losses, :integer, null:false, default:0
      t.change :ties, :integer, null:false, default:0
    end
  end
end
