# frozen_string_literal: true

class UserRepo < ApplicationRecord
  validates :repo_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :repo_id }

  belongs_to :user
  belongs_to :repo
  has_many :taggings
  has_many :tags, through: :taggings
end
