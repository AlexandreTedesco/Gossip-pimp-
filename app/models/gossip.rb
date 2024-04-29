class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :city
  has_many :tags
  validates :title, presence: true
  validates :content, presence: true
  #has_many :like, as: :likeable
end
