class Room < ApplicationRecord
    belongs_to :domicile
    has_many :outlets, dependent: :destroy
end
