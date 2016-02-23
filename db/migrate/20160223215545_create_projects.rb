class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.datetime :end_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
