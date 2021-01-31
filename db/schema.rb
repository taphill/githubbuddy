# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_22_225551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repos", force: :cascade do |t|
    t.bigint "github_id", null: false
    t.string "name", null: false
    t.string "owner", null: false
    t.string "url", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["github_id"], name: "index_repos_on_github_id", unique: true
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "user_repo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["user_repo_id"], name: "index_taggings_on_user_repo_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_repos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "repo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repo_id"], name: "index_user_repos_on_repo_id"
    t.index ["user_id", "repo_id"], name: "index_user_repos_on_user_id_and_repo_id", unique: true
    t.index ["user_id"], name: "index_user_repos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "github_id", null: false
    t.string "nickname", null: false
    t.string "image"
    t.string "github_token", null: false
    t.string "auth_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["github_id"], name: "index_users_on_github_id", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "user_repos"
  add_foreign_key "user_repos", "repos"
  add_foreign_key "user_repos", "users"
end
