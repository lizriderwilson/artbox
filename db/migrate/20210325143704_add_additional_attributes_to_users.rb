class AddAdditionalAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :icon, :string
  end
end
