class CreateRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :repos do |t|
      t.bigint :github_id, null: false
      t.string :name, null: false
      t.string :owner, null: false
      t.string :url, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :repos, :github_id, unique: true
  end
end
