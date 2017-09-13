class User < ApplicationRecord
    has_one :domicile, dependent: :destroy
end
