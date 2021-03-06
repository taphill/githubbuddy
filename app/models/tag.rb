# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :taggings, dependent: :destroy
  has_many :user_repos, through: :taggings
end
