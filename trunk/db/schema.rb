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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121112114026) do

  create_table "bestandteile_bwa_bestandteiles", :force => true do |t|
    t.integer  "menge"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bestandteiles", :force => true do |t|
    t.string   "name"
    t.decimal  "preis"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bestellung_besteht_aus_produktens", :force => true do |t|
    t.integer  "stueckzahl"
    t.decimal  "preisBestellung"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "bestellungs", :force => true do |t|
    t.string   "lStrasse"
    t.integer  "lPlz"
    t.integer  "lHausnummer"
    t.string   "lOrt"
    t.date     "datum"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "kundes", :force => true do |t|
    t.string   "name"
    t.string   "vorname"
    t.integer  "telnr"
    t.string   "email"
    t.string   "rStrasse"
    t.integer  "rPlz"
    t.string   "rOrt"
    t.integer  "rHausnummer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "produktes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "produktbild"
  end

end
