class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :funds, through: :rewards
  has_many :comments

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  validates :description, :title, presence: true
  validates :goal, numericality: {only_integer: true}


end
