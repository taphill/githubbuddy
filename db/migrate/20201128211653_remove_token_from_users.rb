class RemoveTokenFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :token, :string
  end
end
