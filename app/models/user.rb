class User < ApplicationRecord
  belongs_to :city
  has_many :gossip
  has_many :privatemessage
  has_many :comment
end
