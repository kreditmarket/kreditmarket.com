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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120530003150) do

  create_table "offices", :force => true do |t|
    t.string   "slug"
    t.string   "address"
    t.string   "phone"
    t.text     "description"
    t.text     "map"
    t.string   "mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.string   "personal_last_name"
    t.string   "personal_first_name"
    t.string   "personal_surname"
    t.date     "personal_birth_date"
    t.string   "personal_birth_place"
    t.string   "personal_relationship_status"
    t.string   "personal_education"
    t.string   "personal_inn"
    t.integer  "personal_izhd_count"
    t.string   "doc_seria"
    t.string   "doc_number"
    t.date     "doc_date"
    t.string   "doc_author"
    t.string   "reg_region"
    t.string   "reg_city"
    t.string   "reg_street"
    t.string   "reg_house"
    t.string   "reg_building"
    t.string   "reg_flat"
    t.string   "reg_phone"
    t.string   "fact_region"
    t.string   "fact_city"
    t.string   "fact_street"
    t.string   "fact_house"
    t.string   "fact_building"
    t.string   "fact_flat"
    t.string   "fact_period"
    t.string   "fact_st_phone"
    t.string   "fact_mob_phone"
    t.string   "fisrt_cont_per_last_name"
    t.string   "fisrt_cont_per_first_name"
    t.string   "fisrt_cont_per_surname"
    t.string   "fisrt_cont_per_relatives_level"
    t.string   "fisrt_cont_per_st_phone"
    t.string   "fisrt_cont_per_mob_phone"
    t.string   "second_cont_per_last_name"
    t.string   "second_cont_per_surname"
    t.string   "second_cont_per_relatives_level"
    t.string   "second_cont_per_st_phone"
    t.string   "inc_activity_sphere"
    t.string   "inc_record_of_service"
    t.string   "inc_post"
    t.string   "inc_salary"
    t.string   "inc_org_name"
    t.string   "inc_org_city"
    t.string   "inc_org_street"
    t.string   "inc_org_house"
    t.string   "inc_org_building"
    t.string   "inc_org_office"
    t.string   "inc_org_phone"
    t.string   "inc_org_site"
    t.integer  "amount"
    t.integer  "return_term"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_as_reg"
    t.string   "second_cont_per_first_name"
    t.string   "second_cont_per_mob_phone"
    t.integer  "days"
    t.string   "agent_code"
    t.boolean  "is_agent_paid",                   :default => false
    t.boolean  "is_accepted",                     :default => false
    t.string   "personal_mob_phone"
    t.boolean  "is_mini",                         :default => false
    t.integer  "creator_id"
    t.string   "token"
    t.string   "personal_maiden_name"
    t.string   "third_cont_per_first_name"
    t.string   "third_cont_per_last_name"
    t.string   "third_cont_per_surname"
    t.string   "third_cont_per_relatives_level"
    t.string   "third_cont_per_st_phone"
    t.string   "third_cont_per_mob_phone"
    t.string   "inc_org_boss_phone"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "agent_code"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
