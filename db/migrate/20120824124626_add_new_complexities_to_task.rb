class AddNewComplexitiesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :final_complexity, :float
    add_column :tasks, :corrected_complexity, :float
  end
end
