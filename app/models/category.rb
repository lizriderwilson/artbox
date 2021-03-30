class Category < ActiveRecord::Base

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        self.all.find do |instance|
            instance.slug == slug
        end
    end

    has_many :supplies
    has_many :users, through: :supplies
    
    validates :name, presence: true, uniqueness: true
end