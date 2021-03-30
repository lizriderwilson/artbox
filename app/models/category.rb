class Category < ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    
    has_many :supplies
    has_many :users, through: :supplies
    
    validates :name, presence: true, uniqueness: true
end