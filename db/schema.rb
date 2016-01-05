# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151201174837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "recipe_id"
  end

  add_index "bookmarks", ["recipe_id"], name: "index_bookmarks_on_recipe_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_to_recipes", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_to_recipes", ["category_id"], name: "index_categories_to_recipes_on_category_id", using: :btree
  add_index "categories_to_recipes", ["recipe_id"], name: "index_categories_to_recipes_on_recipe_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.text     "comment_text"
    t.text     "typen"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "media"
  end

  add_index "comments", ["recipe_id"], name: "index_comments_on_recipe_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follows", ["target_id"], name: "index_follows_on_target_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "ingredient_recipe_associations", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_recipe_associations", ["ingredient_id"], name: "index_ingredient_recipe_associations_on_ingredient_id", using: :btree
  add_index "ingredient_recipe_associations", ["recipe_id"], name: "index_ingredient_recipe_associations_on_recipe_id", using: :btree

  create_table "ingredient_suggestions", force: :cascade do |t|
    t.string   "name"
    t.integer  "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "recipe_tag_associations", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_tag_associations", ["recipe_id"], name: "index_recipe_tag_associations_on_recipe_id", using: :btree
  add_index "recipe_tag_associations", ["tag_id"], name: "index_recipe_tag_associations_on_tag_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "difficulty"
    t.float    "time"
    t.integer  "portions"
    t.text     "media"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "stepnumber"
    t.string   "name"
    t.float    "time"
    t.text     "description"
    t.text     "media"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "gender"
    t.string   "image"
    t.date     "birth"
    t.integer  "private",                default: 0
    t.string   "about"
    t.string   "slug"
    t.string   "lastname"
    t.string   "uid"
    t.string   "fbtoken"
    t.string   "instatoken"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "comments", "users"
end
