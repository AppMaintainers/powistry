class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :project
      t.belongs_to :complexity
      t.belongs_to :end_complexity
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :invoice_number
      t.integer :invested_hours

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :project_id
  end
end
