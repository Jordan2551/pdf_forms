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

ActiveRecord::Schema.define(version: 20180404200250) do

  create_table "clients", force: :cascade do |t|
    t.string "address"
    t.string "bank_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_address"
    t.string "case_number"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "mailing_address"
    t.string "work_phone_number"
    t.string "county_name"
    t.boolean "alimony_child_support_required"
    t.string "alimony_child_support_state"
    t.integer "what_to_collect"
    t.decimal "how_much_money_owed"
    t.boolean "receiving_payments"
    t.boolean "receiving_public_assistance"
    t.string "receiving_public_assistance_description"
    t.string "home_phone_number"
    t.integer "registration_step", default: 1
    t.string "alternate_contact_name"
    t.string "alternate_contact_phone_number"
    t.date "birth_date"
    t.string "owes_money_race"
    t.string "owes_money_first_name"
    t.string "owes_money_last_name"
    t.string "owes_money_street"
    t.integer "owes_money_apt"
    t.string "owes_money_city"
    t.string "owes_money_county"
    t.string "owes_money_state"
    t.string "owes_money_zip"
    t.string "owes_money_work_address"
    t.string "owes_money_phone_number"
    t.string "owes_money_email"
    t.boolean "owes_money_is_in_jail"
    t.string "gender"
    t.string "owes_money_middle_name"
  end

  create_table "settings", force: :cascade do |t|
    t.string "jc_number"
    t.string "county_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
