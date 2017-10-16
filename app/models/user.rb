class User < ApplicationRecord
	belongs_to :usuario
    has_one :domicile, dependent: :destroy

    before_create :build_default_domicile
    
    def build_default_domicile
        build_domicile
        true
    end
end
