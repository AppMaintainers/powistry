# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base
  attr_accessible :name, :user_ids
  has_many :tasks, :dependent => :destroy
  has_and_belongs_to_many :users
  
  validates :name, :presence => true

  default_scope order("name ASC")
end
