# == Schema Information
#
# Table name: projects
#
#  id         :integer         primary key
#  name       :string(255)
#  created_at :timestamp       not null
#  updated_at :timestamp       not null
#

class Project < ActiveRecord::Base
  attr_accessible :name, :user_ids
  has_many :tasks, :dependent => :destroy
  has_and_belongs_to_many :users
  
  validates :name, :presence => true
end
