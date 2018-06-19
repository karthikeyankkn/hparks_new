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

ActiveRecord::Schema.define(version: 2018_06_19_082102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "camp_leads", force: :cascade do |t|
    t.string "from"
    t.string "name"
    t.string "email"
    t.string "plot_size"
    t.string "phone_number"
    t.text "queries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enquires", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "number"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.text "merchant_id"
    t.text "order_id"
    t.text "amount"
    t.text "currency"
    t.text "redirect_url"
    t.text "cancel_url"
    t.text "language"
    t.text "billing_name"
    t.text "billing_address"
    t.text "billing_city"
    t.text "billing_state"
    t.text "billing_zip"
    t.text "billing_country"
    t.text "billing_tel"
    t.text "billing_email"
    t.text "delivery_name"
    t.text "delivery_address"
    t.text "delivery_city"
    t.text "delivery_state"
    t.text "delivery_zip"
    t.text "delivery_country"
    t.text "delivery_tel"
    t.text "merchant_param1"
    t.text "merchant_param2"
    t.text "merchant_param3"
    t.text "merchant_param4"
    t.text "merchant_param5"
    t.text "promo_code"
    t.text "customer_identifier"
    t.text "integration_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plot_sizes", force: :cascade do |t|
    t.string "size"
    t.integer "amount"
    t.string "value"
    t.integer "sequence"
    t.string "thumb_image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "full_message"
  end

  create_table "response_details", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "plot_details"
    t.bigint "number"
    t.boolean "payment_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "full_message"
    t.integer "order_id"
  end

end
