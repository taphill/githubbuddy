class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :user_repo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
