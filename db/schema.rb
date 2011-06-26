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

ActiveRecord::Schema.define(:version => 20110626231601) do

  create_table "instruments", :force => true do |t|
    t.string   "type",                                              :null => false
    t.string   "author"
    t.boolean  "share",                           :default => true, :null => false
    t.text     "description"
    t.string   "name"
    t.string   "envelope"
    t.string   "wave"
    t.string   "output"
    t.string   "length"
    t.string   "shape"
    t.string   "sweep"
    t.string   "vib_type"
    t.string   "pu2_tune"
    t.string   "pu_fine"
    t.string   "automate"
    t.string   "table"
    t.string   "volume"
    t.string   "play"
    t.string   "repeat"
    t.string   "speed"
    t.string   "synth_wave"
    t.string   "synth_filter"
    t.string   "synth_q"
    t.string   "synth_dist"
    t.string   "synth_phase"
    t.string   "synth_start_volume"
    t.string   "synth_start_cutoff"
    t.string   "synth_start_phase"
    t.string   "synth_start_vshift"
    t.string   "synth_end_volume"
    t.string   "synth_end_cutoff"
    t.string   "synth_end_phase"
    t.string   "synth_end_vshift"
    t.string   "table_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instrument_name",    :limit => 5
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "login",                               :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.string   "single_access_token"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
