class AddRewardIdToFund < ActiveRecord::Migration
  def change
    add_column :funds, :reward_id, :integer
  end
end
