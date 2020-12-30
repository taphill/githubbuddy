# frozen_string_literal: true

class User < ApplicationRecord
  validates :github_id, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

  has_secure_token :auth_token

  has_many :user_repos
  has_many :repos, through: :user_repos

  def self.from_omniauth(auth_hash)
    find_by(github_id: auth_hash['uid'].to_i) || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create do |user|
      user.github_id = auth_hash['uid'].to_i
      user.nickname = auth_hash['info']['nickname']
      user.image = auth_hash['info']['image']
    end
  end

  def tags
    User.joins(user_repos: [taggings: :tag])
        .select('tags.name')
        .where(id: id)
        .pluck('tags.name')
  end

  def repos_with_tag(tag_name)
    Repo.joins(user_repos: [taggings: :tag])
        .where(user_repos: { user_id: id })
        .where(tags: { name: tag_name })
  end
end
