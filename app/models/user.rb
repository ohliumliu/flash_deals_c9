class User < ActiveRecord::Base
  has_many :alert
  attr_accessible :email, :name
end
