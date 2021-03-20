class Supply < ActiveRecord::Base
    belongs_to :user
    has_many :supply_categories
    has_many :categories, through: :supply_categories

end