class AddColumnPhoneNoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_no, :string
  end
end
