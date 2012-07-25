class ProjectsUsers < ActiveRecord::Migration
  def change
  create_table :projects_users, :id => false do |t|
      t.references :user, :null => false
      t.references :project, :null => false
    end

    # Adding the index can massively speed up join tables. Don't use the
    # unique if you allow duplicates.
    add_index(:projects_users, [:user_id, :project_id], :unique => true)
  end
end
