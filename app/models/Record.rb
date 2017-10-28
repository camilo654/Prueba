class Record < ApplicationRecord
    belongs_to :outlet
    def self.by_outlet( outlet_id )
    	load.where( {outlet_id: outlet_id} )
  	end
end