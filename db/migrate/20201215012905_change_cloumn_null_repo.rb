class ChangeCloumnNullRepo < ActiveRecord::Migration[6.0]
  def change
    change_column_null :repos, :github_repo_id, false
  end
end
