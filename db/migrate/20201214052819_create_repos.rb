class CreateRepos < ActiveRecord::Migration[6.0]
  def change
    create_table :repos do |t|
      t.integer :github_repo_id
      t.string :name

      t.timestamps
    end
  end
end
