class City < ApplicationRecord
  has_many :gossip
  has_many :user
end
