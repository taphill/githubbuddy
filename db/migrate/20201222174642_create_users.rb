class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.bigint :github_id, null: false
      t.string :nickname, null: false
      t.string :image
      t.string :auth_token, null: false

      t.timestamps
    end

    add_index :users, :github_id, unique: true
    add_index :users, :nickname, unique: true
    add_index :users, :auth_token, unique: true
  end
end
