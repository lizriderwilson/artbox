class CreateSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :supplies do |t|
      t.string :name
      t.text :description
      t.timestamp :created_on
      t.integer :user_id
    end
  end
end
