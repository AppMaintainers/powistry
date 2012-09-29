class AddPrioritiesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :priority, :integer, :default => 2
    Task.all.each do |task|
      task.update_attributes! :priority => 2
    end
  end
end
