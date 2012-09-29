# == Schema Information
#
# Table name: users
#
#  id                     :integer         primary key
#  name                   :string(255)
#  monogram               :string(255)
#  admin                  :boolean
#  created_at             :timestamp       not null
#  updated_at             :timestamp       not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :timestamp
#  remember_created_at    :timestamp
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :timestamp
#  last_sign_in_at        :timestamp
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  email                  :string(255)     default(""), not null
#  avatar_url             :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  if Rails.env.production?
    devise :database_authenticatable,
           :recoverable, :rememberable, :trackable, :validatable
  else
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable 
  end

  # Setup accessible (or protected) attributes for your model
  
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
    
  attr_accessible :admin, :monogram, :name
  has_many :tasks
  has_many :estimations
  has_many :bookmarks
  has_and_belongs_to_many :projects
  
  validates :name, :presence => true
  before_validation :set_monogram 

  default_scope order("name ASC")
    
  # sets the monogram from the name  
  def set_monogram
    self.monogram = name.split.map{|word| word.first}.join.upcase if monogram.blank?
  end
end
