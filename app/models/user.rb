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

    def total_consumption(user_id)
     puts user_id
     @household_appliances = HouseholdAppliance.where("user_id = ?", user_id)
     @current_consumption = 0
     for appliance in @household_appliances
       if appliance.outlet_id
         @outlet = Outlet.find(appliance.outlet_id)
         if !(@outlet.estate)
           puts appliance.id
           @current_consumption = @current_consumption + appliance.consumption
         else
           initial = @outlet.updated_at
           final = Time.now
           @appliance_consumption = appliance.consumption + (final - initial)/3600*appliance.electricity_use
           @current_consumption = @current_consumption + @appliance_consumption
           @outlet.update(updated_at: Time.now)
           appliance.update(consumption: @appliance_consumption)
         end
       end
     end
     return @current_consumption
    end
    
end
