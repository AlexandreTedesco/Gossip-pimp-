class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  validates :content, presence: true
  #has_many :likes, as: :likeable
end
