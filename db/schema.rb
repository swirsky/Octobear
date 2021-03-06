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

ActiveRecord::Schema.define(version: 20150328161519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allegiances", force: :cascade do |t|
    t.integer  "npc_id",     null: false
    t.integer  "faction_id", null: false
    t.string   "status"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "allegiances", ["npc_id", "faction_id"], name: "index_allegiances_on_npc_id_and_faction_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "user_id",     null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chases", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "cr",          null: false
    t.integer  "user_id",     null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "factions", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "campaign_id",  null: false
    t.integer  "leader_id"
    t.string   "description"
    t.string   "main_type"
    t.string   "subtype"
    t.string   "headquarters"
    t.string   "influence"
    t.string   "strength"
    t.boolean  "secret"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "location_id"
  end

  add_index "factions", ["campaign_id"], name: "index_factions_on_campaign_id", using: :btree
  add_index "factions", ["location_id"], name: "index_factions_on_location_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "url",        null: false
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "links", ["slug"], name: "index_links_on_slug", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "campaign_id", null: false
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parent_id"
  end

  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree
  add_index "locations", ["parent_id"], name: "index_locations_on_parent_id", using: :btree

  create_table "npc_relations", force: :cascade do |t|
    t.integer  "campaign_id",                     null: false
    t.integer  "npc1_id",                         null: false
    t.integer  "npc2_id",                         null: false
    t.string   "status",      default: "Neutral", null: false
    t.string   "notes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "npc_relations", ["campaign_id"], name: "index_npc_relations_on_campaign_id", using: :btree
  add_index "npc_relations", ["npc1_id", "npc2_id"], name: "index_npc_relations_on_npc1_id_and_npc2_id", using: :btree

  create_table "npcs", force: :cascade do |t|
    t.string   "name",                 null: false
    t.integer  "campaign_id",          null: false
    t.string   "description"
    t.string   "race"
    t.string   "gender"
    t.string   "location_name"
    t.string   "notes"
    t.string   "influence"
    t.string   "strength"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "location_id"
    t.string   "personality"
    t.string   "physical_description"
    t.string   "publicity"
  end

  add_index "npcs", ["campaign_id"], name: "index_npcs_on_campaign_id", using: :btree
  add_index "npcs", ["location_id"], name: "index_npcs_on_location_id", using: :btree

  create_table "obstacles", force: :cascade do |t|
    t.string   "primary_skill",   null: false
    t.string   "secondary_skill"
    t.integer  "dc",              null: false
    t.string   "description"
    t.integer  "chase_id",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.integer  "order"
  end

  create_table "one_time_pads", force: :cascade do |t|
    t.string   "input",                                 null: false
    t.string   "cypher",                                null: false
    t.string   "output",                                null: false
    t.integer  "line_length",              default: 25, null: false
    t.integer  "group_length",             default: 5,  null: false
    t.integer  "number_of_keys",           default: 1,  null: false
    t.integer  "key_length",               default: 25, null: false
    t.integer  "seed",           limit: 8,              null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",                               null: false
  end

  add_index "one_time_pads", ["user_id"], name: "index_one_time_pads_on_user_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "book_id",                  null: false
    t.integer  "page_number",              null: false
    t.integer  "line_length", default: 50, null: false
    t.string   "text",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reverse_date_cyphers", force: :cascade do |t|
    t.string   "input",       null: false
    t.integer  "date_cypher", null: false
    t.string   "output",      null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rot_cyphers", force: :cascade do |t|
    t.string   "input",                   null: false
    t.integer  "user_id",                 null: false
    t.integer  "rot",        default: 12, null: false
    t.string   "output",                  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "running_keys", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "book_id",                      null: false
    t.integer  "group_length",    default: 5,  null: false
    t.string   "input",           default: "", null: false
    t.string   "indicator_block",              null: false
    t.string   "output",                       null: false
    t.integer  "page_number",                  null: false
    t.integer  "line",                         null: false
    t.string   "key",                          null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "page_id"
  end

  create_table "transposition_ciphers", force: :cascade do |t|
    t.string   "input",                           null: false
    t.integer  "user_id",                         null: false
    t.string   "keyword",                         null: false
    t.string   "output",                          null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "output_line_length", default: 25, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",                  default: "", null: false
    t.string   "username"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "access_role",                         null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "v_square_cyphers", force: :cascade do |t|
    t.string   "input"
    t.integer  "user_id"
    t.string   "output"
    t.string   "codeword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
