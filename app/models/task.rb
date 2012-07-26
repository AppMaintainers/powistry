class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :complexity
  belongs_to :end_complexity, :class_name => "Complexity"
  has_many :estimations
  
  validates :project, :name, :start_date, :presence => true
  validates :invested_hours, :numericality => true, :allow_nil => true
  
  attr_accessible :user_id, :project_id, :complexity_id, :complexity,
   :description, :end_complexity_id, :end_date, :invested_hours, 
   :invoice_number, :name, :start_date
   
  after_save :create_estimations_for_users_on_project
  
  def create_estimations_for_users_on_project
    self.project.users.each do |user|
      Estimation.create(:user => user, :task => self)
    end
  end
   
end
