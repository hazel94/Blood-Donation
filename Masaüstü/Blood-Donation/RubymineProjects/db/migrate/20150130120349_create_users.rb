class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.integer :phone_no
      t.string :email
      t.text :address
      t.string :id_no

      t.timestamps null: false
    end
  end
end
