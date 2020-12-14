class Repo < ApplicationRecord
  validates_presence_of :github_repo_id, :name

  has_many :user_repos
  has_many :users, through: :user_repos
end
