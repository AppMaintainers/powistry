module TasksHelper

  def complexity_tooltip
  "<table><tr><th>Complexity:</th><th>Planned duration min:</th><th>Planned duration max:</th><th>Points:</th>"+Complexity.all.sort_by{|c| c.points}
.map{|c| ["<tr><td>", c.code,"</td><td>",c.planned_duration_min,"</td><td>",c.planned_duration_max,"</td><td>",c.points,"</td></tr>"]}.join+"</table>"
  end

  def get_average_points(estimations)
    if estimations.any? {|est| est.complexity.nil?}
      return nil
    else
      mean = (estimations.map{|est| est.complexity.points}.sum.to_f/estimations.size*100).round.to_f/100
    end
  end
  
  def get_average_min_hours(estimations)
    if estimations.any? {|est| est.complexity.nil?}
      return nil
    else
      mean = (estimations.map{|est| est.complexity.planned_duration_min}.sum.to_f/estimations.size*100).round.to_f/100
    end
  end
  
  def get_average_max_hours(estimations)
    if estimations.any? {|est| est.complexity.nil?}
      return nil
    else
      mean = (estimations.map{|est| est.complexity.planned_duration_max}.sum.to_f/estimations.size*100).round.to_f/100
    end
  end
  
  def max_pts(task_list)
    task_list.collect{|t| t.user}.uniq.compact.map{|u| u.tasks.where(:id => task_list).map{|t| get_average_points(t.estimations)}.sum}.max
  end
  
  def user_sum_points(user)
    @tasks.where("user_id = ?", user.id).map{|t| get_average_points(t.estimations)}.sum
  end
  
  def user_sum_inv_hours(user)
    @tasks.where("user_id = ?", user.id).map{|t| t.invested_hours}.compact.sum
  end
  
  def user_sum_min_hours(user)
    @tasks.where("user_id = ?", user.id).map{|t| get_average_min_hours(t.estimations)}.sum
  end
  
  def user_sum_max_hours(user)
    @tasks.where("user_id = ?", user.id).map{|t| get_average_max_hours(t.estimations)}.sum
  end

end
