class City < ApplicationRecord
  has_many :gossips
  has_many :users
end
