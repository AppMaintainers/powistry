class AddPrioritiesToTask < ActiveRecord::Migration
  class Task < ActiveRecord::Base
    attr_accessible :priority
  end
  
  def change
    add_column :tasks, :priority, :integer, :default => 2
    Task.all.each do |task|
      task.update_attributes! :priority => 2
    end
  end
end
