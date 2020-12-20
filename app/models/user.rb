# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

  has_secure_token :auth_token

  has_many :user_repos
  has_many :repos, through: :user_repos

  def self.from_omniauth(auth_hash)
    find_by(uid: auth_hash['uid']) || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create do |user|
      user.uid = auth_hash['uid']
      user.nickname = auth_hash['info']['nickname']
      user.image = auth_hash['info']['image']
    end
  end
end
