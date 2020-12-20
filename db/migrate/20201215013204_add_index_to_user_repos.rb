class AddIndexToUserRepos < ActiveRecord::Migration[6.0]
  def change
    add_index :user_repos, [:user_id, :repo_id], unique: true
  end
end
