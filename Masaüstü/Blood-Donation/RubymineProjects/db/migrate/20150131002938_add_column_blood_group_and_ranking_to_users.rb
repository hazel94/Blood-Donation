class AddColumnBloodGroupAndRankingToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :blood_group, :string
  	add_column :users, :ranking, :integer
  end
end
