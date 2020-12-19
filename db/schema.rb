# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_19_225828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repos", force: :cascade do |t|
    t.integer "github_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "owner"
    t.string "url"
    t.string "description"
    t.index ["github_id"], name: "index_repos_on_github_id", unique: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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
    t.string "uid", null: false
    t.string "nickname", null: false
    t.string "name", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "taggings", "tags"
  add_foreign_key "user_repos", "repos"
  add_foreign_key "user_repos", "users"
end
