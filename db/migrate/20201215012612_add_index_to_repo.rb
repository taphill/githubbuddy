class AddIndexToRepo < ActiveRecord::Migration[6.0]
  def change
    add_index :repos, :github_repo_id, unique: true
  end
end
