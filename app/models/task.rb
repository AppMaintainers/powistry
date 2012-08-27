class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :estimations, :dependent => :destroy
  
  validates :project, :name, :presence => true
  validates :invested_hours, :numericality => true, :allow_nil => true
  
  attr_accessible :name, :description, :url, :invoice_number,
   :start_date, :end_date, :invested_hours, :id, :user_id, :project_id, :final_complexity,
   :corrected_complexity
   
  after_create :create_estimations_for_users_on_project
  
  def create_estimations_for_users_on_project
    self.project.users.each do |user|
      Estimation.find_or_create_by_user_id_and_task_id(user.id, self.id)
    end
  end
  
  scope :opened, lambda{|date| where("start_date <= ? AND end_date IS NULL", date)}
  scope :not_yet_opened, lambda{|| where("start_date IS NULL")}
   
end
