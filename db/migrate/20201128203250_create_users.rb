class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :token, null: false
      t.string :nickname, null: false
      t.string :name, null: false
      t.string :image

      t.timestamps
    end
  end
end
