class DropColumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :phone_no
  end
end
