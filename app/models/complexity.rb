class Complexity < ActiveRecord::Base
  attr_accessible :code, :planned_duration_max, :planned_duration_min, :points
  
  validates :planned_duration_min, :planned_duration_max, :points, 
  :presence => true, :numericality => true
  validates :code, :inclusion => { :in => %w(XS S M L),
    :message => "%{code} is not a valid code" } 
  
  #this the first thing SimpleForm looks for
  def to_label 
    "#{code}"
  end

end
