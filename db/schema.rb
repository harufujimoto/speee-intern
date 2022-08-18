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

ActiveRecord::Schema[7.0].define(version: 2022_08_18_080845) do
  create_table "property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "property_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "sex"
    t.integer "age"
    t.string "address"
    t.integer "sale_count"
    t.date "sale_consideration_at"
    t.date "evaluation_request_at"
    t.date "launch_at"
    t.date "sale_at"
    t.date "delivery_at"
    t.integer "evaluation_price"
    t.integer "sale_price"
    t.boolean "price_cut"
    t.integer "price_cut_month"
    t.integer "price_cut_range"
    t.integer "closing_price"
    t.integer "contract_type"
    t.string "headline"
    t.string "sale_reason"
    t.text "worried"
    t.text "decision_reason"
    t.integer "satisfaction"
    t.text "satisfaction_reason"
    t.text "advice"
    t.text "improvement_point"
    t.bigint "property_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_reviews_on_property_type_id"
  end

  add_foreign_key "reviews", "property_types"
end
