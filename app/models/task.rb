class Task < ActiveRecord::Base
  attr_accessible :due_date, :priority, :title, :user_id
  belongs_to :user
  validates :title, :length => { :maximum => 140, :minimum => 2 }
  validates :user_id, :length => { :maximum => 4, :minimum => 1 }
  validates :priority, :length => { :maximum => 2, :minimum => 1 }
end
