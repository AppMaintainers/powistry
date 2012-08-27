class Estimation < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :complexity
  # attr_accessible :title, :body
  
  validates :user, :task, :presence => true
  
  attr_accessible :user_id, :task_id, :complexity_id, :user, :task, :complexity
  
  after_save :get_average_complexity
  
  def get_average_complexity
    unless self.task.estimations.any?{|e| e.complexity.nil?}
      self.task.final_complexity = (self.task.estimations.map{|e| e.complexity.points}.sum.to_f/self.task.estimations.size*100).round.to_f/100
      self.task.save!
    end
  end
end
