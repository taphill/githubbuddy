# frozen_string_literal: true

class Repo < ApplicationRecord
  validates :github_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :owner, presence: true
  validates :url, presence: true

  has_many :user_repos
  has_many :users, through: :user_repos
end
