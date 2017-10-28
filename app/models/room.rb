class Room < ApplicationRecord
    belongs_to :user
    has_many :outlets, dependent: :destroy
end
