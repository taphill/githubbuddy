class RemoveNameFromRepos < ActiveRecord::Migration[6.0]
  def change
    remove_column :repos, :name, :string
  end
end
