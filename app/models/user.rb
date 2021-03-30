class User < ActiveRecord::Base
    
    def slug
        username.downcase.gsub(" ", "-")
    end

    def find_by_slug(slug)
        self.all.find do |instance|
            instance.slug == slug
        end
    end

    has_many :supplies
    has_many :categories, through: :supplies

    has_secure_password

    validates :username, presence: true, uniqueness: true
end