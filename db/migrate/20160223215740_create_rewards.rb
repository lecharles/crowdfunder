class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :project_id
      t.integer :min_amount
      t.integer :max_amount
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
