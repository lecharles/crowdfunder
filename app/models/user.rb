class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :funds
  has_many :projects
  has_many :comments
end
