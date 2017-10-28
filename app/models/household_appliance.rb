class HouseholdAppliance < ApplicationRecord
    belongs_to :user
    belongs_to :outlet, optional: true
    belongs_to :category, optional: true
    has_many :registers
    #has_many :categories, through: :categorizations
end
