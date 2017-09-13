class Category < ApplicationRecord
    has_many :categorizations
    has_many :household_apliances, through: :categorizations
end
