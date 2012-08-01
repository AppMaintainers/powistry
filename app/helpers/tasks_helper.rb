module TasksHelper

  def get_average_points(estimations)
    if estimations.any? {|est| est.complexity.nil?}
      return nil
    else
      mean = (estimations.map{|est| est.complexity.points}.sum.to_f/estimations.size*100).round.to_f/100
    end
  end

end
