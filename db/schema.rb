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

ActiveRecord::Schema.define(version: 20180313120036) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "status", default: 0
    t.integer "user_id"
    t.integer "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_messages_on_reservation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "newsletter_histories", force: :cascade do |t|
    t.integer "newsletter_id"
    t.integer "newsletter_subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_id"], name: "index_newsletter_histories_on_newsletter_id"
    t.index ["newsletter_subscription_id"], name: "index_newsletter_histories_on_newsletter_subscription_id"
  end

  create_table "newsletter_subscriptions", force: :cascade do |t|
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.string "country"
    t.string "job"
    t.string "phone"
    t.string "unsubscribe_link"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "object"
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_newsletters_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.integer "user_id"
    t.string "slug"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "duration"
    t.string "country", limit: 2
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["country"], name: "index_products_on_country"
    t.index ["slug"], name: "index_products_on_slug", unique: true
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "reservation_statuses", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reservation_statuses_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "persons", default: 1
    t.datetime "start_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reservations_on_product_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.string "firstname"
    t.string "lastname"
    t.string "picture"
    t.integer "login_count", default: 0, null: false
    t.integer "integer", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.string "slug"
    t.string "new_email"
    t.string "email_token"
    t.datetime "email_token_updated_at"
    t.boolean "activated", default: false, null: false
    t.string "perishable_token", default: "", null: false
    t.string "string", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["perishable_token"], name: "index_users_on_perishable_token"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

end
