class User < ApplicationRecord
	belongs_to :usuario
    has_one :domicile, dependent: :destroy
end
