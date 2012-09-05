class ChangeTextLimitNil < ActiveRecord::Migration
  def up
    change_column :tasks, :description, :text, :limit => nil
  end

  def down
    change_column :tasks, :description, :text, :limit => 255
  end
end
