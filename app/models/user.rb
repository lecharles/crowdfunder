class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :funds
  has_many :projects
  has_many :comments
  has_many :rewards, through: :funds
  has_many :backed_projects, through: :funds, source: "project"

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
end
