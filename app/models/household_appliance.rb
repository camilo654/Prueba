class HouseholdAppliance < ApplicationRecord
    belongs_to :user
    belongs_to :outlet, optional: true
    belongs_to :category, optional: true
    has_many :registers
    #has_many :categories, through: :categorizations
    
	#def self.load
    #	includes( :household_appliance)
  	#end

    def self.by_id( household_appliance_id )
    	load.find_by( {id: household_appliance_id} )
  	end

    def self.by_ids( ids )
        HouseholdAppliance.find( ids )
    end

end
