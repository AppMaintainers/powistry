class Estimation < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :complexity
  # attr_accessible :title, :body
  
  validates :user, :task, :presence => true
  
  attr_accessible :user_id, :task_id, :complexity_id, :user, :task, :complexity
end
