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

ActiveRecord::Schema.define(version: 20160330174526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "badge_name"
    t.integer  "badge_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "creator_id"
    t.integer  "participant_id"
    t.string   "creator_status"
    t.string   "participant_status"
    t.string   "participant_acceptance"
    t.string   "post_type"
    t.string   "post_status"
    t.text     "notes"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "creator_image_file_name"
    t.string   "creator_image_content_type"
    t.integer  "creator_image_file_size"
    t.datetime "creator_image_updated_at"
    t.string   "participant_image_file_name"
    t.string   "participant_image_content_type"
    t.integer  "participant_image_file_size"
    t.datetime "participant_image_updated_at"
  end

  add_index "challenges", ["recipe_id"], name: "index_challenges_on_recipe_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["challenge_id"], name: "index_comments_on_challenge_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.text     "step"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "instructions", ["recipe_id"], name: "index_instructions_on_recipe_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.string   "winner"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likes", ["challenge_id"], name: "index_likes_on_challenge_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "quantities", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.string   "measurement"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "quantities", ["ingredient_id"], name: "index_quantities_on_ingredient_id", using: :btree
  add_index "quantities", ["recipe_id"], name: "index_quantities_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "video_url"
    t.integer  "cook_time"
    t.integer  "serving"
    t.string   "course"
    t.boolean  "vegan"
    t.boolean  "gluten_free"
    t.boolean  "low_carb"
    t.boolean  "dairy_free"
    t.boolean  "nut_free"
    t.boolean  "soy_free"
    t.string   "equipment"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "dish_image_file_name"
    t.string   "dish_image_content_type"
    t.integer  "dish_image_file_size"
    t.datetime "dish_image_updated_at"
    t.string   "ingredients_image_file_name"
    t.string   "ingredients_image_content_type"
    t.integer  "ingredients_image_file_size"
    t.datetime "ingredients_image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                  default: "email", null: false
    t.string   "uid",                       default: "",      null: false
    t.string   "encrypted_password",        default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.boolean  "vegan"
    t.boolean  "vegetarian"
    t.boolean  "lacto_veg"
    t.boolean  "dairy_free"
    t.boolean  "gluten_free"
    t.boolean  "nut_free"
    t.boolean  "soy_free"
    t.string   "skill"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_image_file_name"
    t.string   "avatar_image_content_type"
    t.integer  "avatar_image_file_size"
    t.datetime "avatar_image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
