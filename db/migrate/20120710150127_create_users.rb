class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :monogram
      t.boolean :admin

      t.timestamps
    end
  end
end
