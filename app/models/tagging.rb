class Tagging < ApplicationRecord
  validates :tag_id, presence: true
  validates :user_repo_id, presence: true

  belongs_to :tag
  belongs_to :user_repo
end
