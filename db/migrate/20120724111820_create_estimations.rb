class CreateEstimations < ActiveRecord::Migration
  def change
    create_table :estimations do |t|
      t.references :user
      t.references :task
      t.references :complexity

      t.timestamps
    end
    add_index :estimations, :user_id
    add_index :estimations, :task_id
    add_index :estimations, :complexity_id
  end
end
