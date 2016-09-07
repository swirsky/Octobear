class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, unique:true, null:false
      t.string :username, unique:true
      t.string :encrypted_password
      t.string :access_role, null:false

      t.timestamps null: false
    end

    add_index :users, :email, unique:true
  end
end
