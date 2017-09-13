class Outlet < ApplicationRecord
    belongs_to :room
    has_one :household_apliance
end
