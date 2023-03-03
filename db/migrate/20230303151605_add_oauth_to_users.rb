class AddOauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string, index: true
    add_column :users, :uid, :string, index: true
  end
end
