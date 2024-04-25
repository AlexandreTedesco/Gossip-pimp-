class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comment
  belongs_to :city
  has_many :tag
end
