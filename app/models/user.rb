class User < ActiveRecord::Base
    has_many :supplies
    has_many :categories, through: :supplies

end