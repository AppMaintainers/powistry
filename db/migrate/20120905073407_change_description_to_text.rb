class ChangeDescriptionToText < ActiveRecord::Migration
  def up
    change_column :tasks, :description, :text
  end

  def down
    change_column :tasks, :description, :string
  end
end
