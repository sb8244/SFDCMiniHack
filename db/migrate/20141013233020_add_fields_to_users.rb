class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sfdc_instance_url, :text
    add_column :users, :sfdc_oauth_token, :text
    add_column :users, :sfdc_refresh_token, :text
    add_column :users, :provider, :text
    add_column :users, :uid, :text
    add_column :users, :name, :text
  end
end
