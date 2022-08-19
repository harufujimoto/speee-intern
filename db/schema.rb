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

ActiveRecord::Schema[7.0].define(version: 2022_08_19_080845) do
  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ieul_company_id", null: false
    t.text "logo_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "property_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sex", null: false
    t.integer "age", null: false
    t.string "address", null: false
    t.integer "sale_count", null: false
    t.date "sale_consideration_at", null: false
    t.date "evaluation_request_at", null: false
    t.date "launch_at", null: false
    t.date "sale_at", null: false
    t.date "delivery_at", null: false
    t.integer "evaluation_price", null: false
    t.integer "sale_price", null: false
    t.boolean "price_cut", null: false
    t.integer "price_cut_month"
    t.integer "price_cut_range"
    t.integer "closing_price", null: false
    t.integer "contract_type", null: false
    t.string "headline", null: false
    t.integer "sale_reason", null: false
    t.text "worried", null: false
    t.text "decision_reason", null: false
    t.integer "satisfaction", null: false
    t.text "satisfaction_reason", null: false
    t.text "advice", null: false
    t.text "improvement_point", null: false
    t.bigint "store_id", null: false
    t.bigint "city_id", null: false
    t.bigint "property_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_reviews_on_city_id"
    t.index ["property_type_id"], name: "index_reviews_on_property_type_id"
    t.index ["store_id"], name: "index_reviews_on_store_id"
  end

  create_table "stores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "ieul_store_id", null: false
    t.string "postal_code"
    t.string "address", null: false
    t.string "phone_number"
    t.string "fax_number"
    t.string "business_duration"
    t.string "regular_holiday"
    t.text "introduction_text", null: false
    t.string "catch_copy", null: false
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_stores_on_city_id"
    t.index ["company_id"], name: "index_stores_on_company_id"
  end

  create_table "valuation_areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_valuation_areas_on_city_id"
    t.index ["store_id"], name: "index_valuation_areas_on_store_id"
  end

  add_foreign_key "cities", "prefectures"
  add_foreign_key "reviews", "cities"
  add_foreign_key "reviews", "property_types"
  add_foreign_key "reviews", "stores"
  add_foreign_key "stores", "cities"
  add_foreign_key "stores", "companies"
  add_foreign_key "valuation_areas", "cities"
  add_foreign_key "valuation_areas", "stores"
end
