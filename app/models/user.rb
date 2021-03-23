class User < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    
    def slug
        username.downcase.gsub(" ", "-")
    end

    has_many :supplies
    has_many :categories, through: :supplies

    has_secure_password

    validates :username, presence: true, uniqueness: true
end