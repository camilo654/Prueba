class User < ApplicationRecord
	
	has_many :rooms, dependent: :destroy
    has_many :household_appliances, dependent: :destroy
    has_many :categories, dependent: :destroy
    

    #before_create :build_default_domicile

    def self.by_email( user_email )
    	self.find_by( {email: user_email} )
  	end

  	def householdApps
  		@HAs = Array.new
    	self.household_appliances.each do |ha|
    			@HAs.push( ha.id )
      	end
    	HouseholdAppliance.by_ids( @lights ) 			
  	end

    
    #def build_default_domicile
    #    build_domicile
    #    true
    #end
    
end
