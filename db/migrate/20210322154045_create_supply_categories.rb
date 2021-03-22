class CreateSupplyCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :supply_categories do |t|
      t.integer :supply_id
      t.integer :category_id
    end
  end
end
