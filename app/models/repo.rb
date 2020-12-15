# frozen_string_literal: true

class Repo < ApplicationRecord
  validates :github_repo_id, presence: true, uniqueness: true

  has_many :user_repos
  has_many :users, through: :user_repos
end
