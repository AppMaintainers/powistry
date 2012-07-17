class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :complexity
  belongs_to :end_complexity, :class_name => "Complexity"
  
  validates :user, :project, :complexity, :end_complexity, :name, :invested_hours, :presence => true
  validates :invested_hours, :numericality => true
  
  attr_accessible :user_id, :project_id, :complexity_id, :complexity,
   :description, :end_complexity_id, :end_date, :invested_hours, :invoice_number, :name, :start_date
end
