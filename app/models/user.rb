class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :tasks
  validates :name, :length => { :maximum => 30, :minimum => 2 }
  validates :email, :length => { :maximum => 30, :minimum => 2 }
end
