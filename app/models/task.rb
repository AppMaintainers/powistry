# == Schema Information
#
# Table name: tasks
#
#  id                   :integer         primary key
#  user_id              :integer
#  project_id           :integer
#  name                 :string(255)
#  description          :text
#  start_date           :date
#  end_date             :date
#  invoice_number       :string(255)
#  invested_hours       :integer
#  created_at           :timestamp       not null
#  updated_at           :timestamp       not null
#  final_complexity     :float
#  corrected_complexity :float
#  url                  :string(255)
#

class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :estimations, :dependent => :destroy

  validates :project, :name, :presence => true
  validates :invested_hours, :numericality => true, :allow_nil => true
  validates :priority, :numericality => { :only_integer => true }, :inclusion => 1..3

  attr_accessible :name, :description, :url, :invoice_number,
   :start_date, :end_date, :invested_hours, :id, :user_id, :project_id, :final_complexity,
   :corrected_complexity, :priority

  after_create :create_estimations_for_users_on_project
  after_update :set_final_complexity_if_closed

  def create_estimations_for_users_on_project
    self.project.users.each do |user|
      Estimation.find_or_create_by_user_id_and_task_id(user.id, self.id)
    end
  end

  def set_final_complexity_if_closed
    unless self.end_date.nil?
      if self.end_date <= Date.today && self.final_complexity.nil?
        unless self.estimations.all?{|e| e.complexity.nil?}
          pts = self.estimations.where("complexity_id IS NOT NULL AND complexity_id != 0").map{|e| e.complexity.points}
          self.final_complexity = (pts.sum.to_f/pts.size*100).round.to_f/100
          self.save
        end
      end
    end
  end

  # Determines the range of final complexity values that corresponds to a specific complexity
  # Example M => (5..11)
  def get_range(complexity)
    comp_range = {}
    complexities = Complexity.all.sort_by{|c| c.points}
    if complexity == complexities.first
      comp_range = (complexities.first.points..((complexities.first.points + complexities.second.points)/2))
    elsif complexity == complexities.last
      comp_range = (((complexities.last.points + complexities[-2].points)/2)..complexities.last.points)
    else
      idx = complexities.find_index(complexity)
      comp_range = (((complexities[idx-1].points + complexities[idx].points)/2)..((complexities[idx].points + complexities[idx+1].points)/2))
    end
    return comp_range
  end

  def get_complexity
    self.corrected_complexity.nil? ? self.final_complexity : self.corrected_complexity
  end

  def get_tasks_near_complexity(complexity, size)
    Task.all.select{|t| t.get_complexity.in? t.get_range(complexity)}[(0..(size-1))]
  end

  scope :opened, lambda{|date| where("start_date <= ? AND end_date IS NULL", date)}
  scope :not_yet_opened, lambda{|| where("start_date IS NULL")}
  scope :closed, lambda{|date| where("end_date <= ?", date)}
  
  default_scope order("priority DESC")

  scope :in_game, where("start_date IS NOT NULL and end_date IS NOT NULL").where("end_date >= ?", Time.now - 4.weeks)
end
