class CreateUserRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_repos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :repo, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_repos, [:user_id, :repo_id], unique: true
  end
end
