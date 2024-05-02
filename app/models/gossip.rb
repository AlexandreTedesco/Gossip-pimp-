class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :city
  has_many :tags
  has_many :likes
  validates :title, presence: true
  validates :content, presence: true
end
