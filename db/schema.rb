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

ActiveRecord::Schema.define(version: 2023_09_16_191036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_item_meals", force: :cascade do |t|
    t.bigint "cart_item_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_item_id"], name: "index_cart_item_meals_on_cart_item_id"
    t.index ["meal_id"], name: "index_cart_item_meals_on_meal_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "shopping_cart_id", null: false
    t.index ["shopping_cart_id"], name: "index_cart_items_on_shopping_cart_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "category_description"
    t.string "CategoryThumb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "meal"
    t.string "meal_thumb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.decimal "price"
    t.index ["category_id"], name: "index_meals_on_category_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "cart_number"
    t.date "card_expire_date"
    t.string "card_user_name"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_item_meals", "cart_items"
  add_foreign_key "cart_item_meals", "meals"
  add_foreign_key "cart_items", "shopping_carts"
  add_foreign_key "meals", "categories"
  add_foreign_key "shopping_carts", "users"
end
