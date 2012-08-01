class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :complexity
  belongs_to :end_complexity, :class_name => "Complexity"
  has_many :estimations, :dependent => :destroy
  
  validates :project, :name, :start_date, :presence => true
  validates :invested_hours, :numericality => true, :allow_nil => true
  
  attr_accessible :user_id, :project_id, :complexity_id, :complexity,
   :description, :end_complexity_id, :end_date, :invested_hours, 
   :invoice_number, :name, :start_date, :id
   
  after_create :create_estimations_for_users_on_project
  
  def create_estimations_for_users_on_project
    self.project.users.each do |user|
      Estimation.find_or_create_by_user_id_and_task_id(user.id, self.id)
    end
  end
  
  scope :after_date, lambda{|date| where("start_date >= ?", date)}
  scope :before_date, lambda{|date| where("end_date <= ?", date)}
  scope :with_invoice_number, lambda{|invnum| where("invoice_number = ?", invnum)}
   
end
