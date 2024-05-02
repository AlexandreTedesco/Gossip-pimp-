class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :privatemessages
  has_many :comments
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true  
end
