class Complexity < ActiveRecord::Base
  attr_accessible :code, :planned_duration_max, :planned_duration_min, :points
  
  def to_label #this the first thing SimpleForm looks for
    "#{code}"
  end

end
