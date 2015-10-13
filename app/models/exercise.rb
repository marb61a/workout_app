class Exercise < ActiveRecord::Base
    belongs_to :user
    
    validates :duration_in_min, presence: true
end