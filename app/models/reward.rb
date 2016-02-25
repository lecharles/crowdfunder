class Reward < ActiveRecord::Base
  belongs_to :project
  belongs_to :fund
end
