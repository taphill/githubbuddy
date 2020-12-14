# frozen_string_literal: true

class AddIndexsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:uid], unique: true
    add_index :users, [:nickname], unique: true
  end
end
