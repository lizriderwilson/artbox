class User < ActiveRecord::Base
    has_many :supplies
    has_many :categories, through: :supplies

    has_secure_password
end