class HouseholdAppliance < ApplicationRecord
    belongs_to :user
    belongs_to :outlet, optional: true
    belongs_to :category, optional: true
    has_many :registers
    #has_many :categories, through: :categorizations
    
    def self.by_id( HouseholdAppliance )
    	load.find_by( {id: HouseholdAppliance} )
  	end
end
