class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user
      t.string :name
      t.string :location

      t.timestamps
    end
    add_index :bookmarks, :user_id
  end
end
