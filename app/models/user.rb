class User < ApplicationRecord
    has_many :potins
    has_one :city
    has_secure_password
end
