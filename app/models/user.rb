# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :name, presence: true

  def self.from_omniauth(auth_hash)
    find_by(uid: auth_hash['uid']) || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create do |user|
      user.uid = auth_hash['uid']
      user.nickname = auth_hash['info']['nickname']
      user.name = auth_hash['info']['name']
      user.image = auth_hash['info']['image']
    end
  end
end
