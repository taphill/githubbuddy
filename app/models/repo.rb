# frozen_string_literal: true

class Repo < ApplicationRecord
  validates :github_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :owner, presence: true
  validates :url, presence: true

  has_many :user_repos, dependent: :destroy
  has_many :users, through: :user_repos
  has_many :tags, through: :user_repos

  def self.search(query:, user_id:)
    words = query.downcase.split.join(' ').gsub(/[^0-9a-z ]/, '').tr(' ', '|')
    search = "%(#{words})%"

    joins(:user_repos)
      .where(user_repos: { user_id: user_id })
      .where('LOWER(name) SIMILAR TO :search OR LOWER(owner) SIMILAR TO :search', search: search)
  end
end
