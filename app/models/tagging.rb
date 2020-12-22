class Tagging < ApplicationRecord
  validates :tag_id, presence: true
  validates :repo_id, presence: true

  belongs_to :tag
  belongs_to :repo
end
