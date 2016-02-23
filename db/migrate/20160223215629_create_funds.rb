class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
