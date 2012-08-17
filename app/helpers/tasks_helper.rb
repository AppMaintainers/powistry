module TasksHelper

  def get_average_points(estimations)
    if estimations.any? {|est| est.complexity.nil?}
      return nil
    else
      mean = (estimations.map{|est| est.complexity.points}.sum.to_f/estimations.size*100).round.to_f/100
    end
  end
  
  def max_pts(task_list)
    task_list.collect{|t| t.user}.uniq.compact.map{|u| u.tasks.where(:id => task_list).map{|t| get_average_points(t.estimations)}.sum}.max
  end
  
  def user_sum_points(user)
    @tasks.where("user_id == ?", user.id).map{|t| get_average_points(t.estimations)}.sum
  end
  
  def user_sum_inv_hours(user)
    @tasks.where("user_id == ?", user.id).map{|t| t.invested_hours}.compact.sum
  end

end
