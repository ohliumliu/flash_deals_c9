class User < ActiveRecord::Base
  has_many :alert
  attr_accessible :email, :name, :password, :password_confirmation, :isadmin
  validates :name, presence: true, length: {in: 2..8}, uniqueness: true
  validates :password, presence: true, length: {minimum: 4}, confirmation: true
  #validates :password_confirmation, presence: true
end
