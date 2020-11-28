class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :name, presence: true
end
