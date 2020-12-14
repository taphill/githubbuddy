class UserRepo < ApplicationRecord
  belongs_to :user
  belongs_to :repo
end
