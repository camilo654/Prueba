class Category < ApplicationRecord
    belongs_to :user
    has_many :household_apliances
end
