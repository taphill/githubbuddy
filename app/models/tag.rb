class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :taggings
  has_many :user_repos, through: :taggings
end
