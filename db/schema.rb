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

ActiveRecord::Schema[8.0].define(version: 2024_12_19_134157) do
  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "client_secret"
    t.string "owner_slack_id"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "redirect_uri"
  end

  create_table "oauth2_sessions", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "client_id", null: false
    t.string "state", null: false
    t.string "redirect_uri", null: false
    t.string "response_type", null: false
    t.string "scope", null: false
    t.string "code", null: false
    t.boolean "show_prompt", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "otp_validated", default: false
    t.index ["user_id"], name: "index_oauth2_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "legal_first_name"
    t.string "legal_last_name"
    t.string "preferred_first_name"
    t.string "preferred_last_name"
    t.string "email"
    t.string "slack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "dob"
    t.string "phone_number"
    t.boolean "verification_enabled", default: true
    t.string "otp_secret"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
