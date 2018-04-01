class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_index  :users, :uid, unique: true
    
    
  end
end
 