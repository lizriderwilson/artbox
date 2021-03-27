class Supply < ActiveRecord::Base
    belongs_to :user
    belongs_to :category

    validates :name, presence: true
end