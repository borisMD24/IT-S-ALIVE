class Tag < ApplicationRecord
    has_many :potins, through: :gossip_tag
end