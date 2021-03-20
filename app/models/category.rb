class Category < ActiveRecord::Base
    has_many :supply_categories
    has_many :supplies, through: :supply_categories
    has_many :users, through: :supplies
    
end