class CreateFacebookUsers < ActiveRecord::Migration
  def change
    create_table :facebook_users do |t|
      t.string :provider
      t.string :fbkuser_id
      t.string :fbkuser_name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
