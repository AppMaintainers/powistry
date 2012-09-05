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
    
  # sets the monogram from the name  
  def set_monogram
    self.monogram = name.split.map{|word| word.first}.join.upcase if monogram.blank?
  end
end
