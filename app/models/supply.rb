class Supply < ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods

    belongs_to :user
    belongs_to :category

    validates :name, presence: true
end