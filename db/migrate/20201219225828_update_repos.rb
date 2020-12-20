class UpdateRepos < ActiveRecord::Migration[6.0]
  def change
    rename_column :repos, :github_repo_id, :github_id

    add_column :repos, :name, :string
    add_column :repos, :owner, :string
    add_column :repos, :url, :string
    add_column :repos, :description, :string
  end
end
