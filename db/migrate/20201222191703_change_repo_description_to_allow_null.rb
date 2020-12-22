class ChangeRepoDescriptionToAllowNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :repos, :description, true
  end
end
