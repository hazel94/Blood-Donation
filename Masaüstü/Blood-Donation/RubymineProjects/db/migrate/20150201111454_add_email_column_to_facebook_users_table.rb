class AddEmailColumnToFacebookUsersTable < ActiveRecord::Migration
  def change
  	add_column :facebook_users, :email, :string
  end
end
