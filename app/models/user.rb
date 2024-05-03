class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :privatemessages
  has_many :comments
  has_many :likes
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "format email error" }
  validates :password, length: { minimum: 8 }, on: :create 
end
