class User < ApplicationRecord
	
	has_many :rooms, dependent: :destroy
    has_many :household_appliances, dependent: :destroy
    has_many :categories, dependent: :destroy
    

    #before_create :build_default_domicile

    
    #def build_default_domicile
    #    build_domicile
    #    true
    #end
    
end
