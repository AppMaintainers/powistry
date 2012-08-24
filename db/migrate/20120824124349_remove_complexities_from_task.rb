class RemoveComplexitiesFromTask < ActiveRecord::Migration
  def up
    remove_column :tasks, :complexity_id
    remove_column :tasks, :end_complexity_id
  end

  def down
    add_column :tasks, :end_complexity_id, :integer
    add_column :tasks, :complexity_id, :integer
  end
end
