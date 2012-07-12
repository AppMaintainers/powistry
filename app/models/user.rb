class User < ActiveRecord::Base
  attr_accessible :admin, :monogram, :name
  has_many :tasks
  
  validates :name, :presence => true
  before_validation :set_monogram
  
  # sets the monogram from the name  
  def set_monogram
    self.monogram = name.split.map{|word| word.first}.join.upcase
  end
end
