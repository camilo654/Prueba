class HouseholdAppliance < ApplicationRecord
    belongs_to :outlet
    has_many :registers
    has_many :categorizations
    #has_many :categories, through: :categorizations
end
