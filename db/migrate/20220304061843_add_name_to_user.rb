class AddNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :user_body, :text
  end
end
