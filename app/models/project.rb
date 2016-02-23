class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :funds
  has_many :comments
end
