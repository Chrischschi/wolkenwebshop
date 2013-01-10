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

ActiveRecord::Schema.define(:version => 20130110122641) do

  create_table "auftrags", :primary_key => "TNr", :force => true do |t|
    t.date     "Datum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "auftrags", ["TNr", "Datum"], :name => "sqlite_autoindex_auftrags_1", :unique => true

  create_table "bedarfs", :primary_key => "TNr", :force => true do |t|
    t.date     "Datum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bedarfs", ["TNr", "Datum"], :name => "sqlite_autoindex_bedarfs_1", :unique => true

  create_table "bedarfsableitungs", :primary_key => "AuTNr", :force => true do |t|
    t.integer  "BeTNr"
    t.date     "AuDatum"
    t.date     "BeDatum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bedarfsableitungs", ["AuTNr", "BeTNr", "BeDatum", "AuDatum"], :name => "sqlite_autoindex_bedarfsableitungs_1", :unique => true

  create_table "bedarfsdeckungs", :primary_key => "AuTNr", :force => true do |t|
    t.integer  "BeTNr"
    t.date     "AuDatum"
    t.date     "BeDatum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bedarfsdeckungs", ["AuTNr", "BeTNr", "BeDatum", "AuDatum"], :name => "sqlite_autoindex_bedarfsdeckungs_1", :unique => true

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "vorname"
    t.integer  "telnr"
    t.string   "email"
    t.string   "rStr"
    t.integer  "rPlz"
    t.string   "rOrt"
    t.integer  "rHausNr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "passwort"
    t.boolean  "isAdmin"
  end

  create_table "lagerdeckungs", :primary_key => "LNr", :force => true do |t|
    t.integer  "TNr"
    t.date     "Datum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "lagerdeckungs", ["LNr", "TNr"], :name => "sqlite_autoindex_lagerdeckungs_1", :unique => true

  create_table "lagers", :force => true do |t|
    t.integer  "LNr"
    t.integer  "TNr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "may_orders", :primary_key => "customerID", :force => true do |t|
    t.integer "orderID"
  end

  add_index "may_orders", ["customerID", "orderID"], :name => "sqlite_autoindex_may_orders_1", :unique => true

  create_table "orders", :force => true do |t|
    t.string   "lStrasse"
    t.integer  "lPlz"
    t.integer  "lHausnr"
    t.string   "lOrt"
    t.date     "datum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders_consists_of_parts", :primary_key => "orderID", :force => true do |t|
    t.integer "partID"
    t.integer "stueckzahl"
    t.decimal "preisBestellung", :precision => 7, :scale => 2
  end

  add_index "orders_consists_of_parts", ["orderID", "partID"], :name => "sqlite_autoindex_orders_consists_of_parts_1", :unique => true

  create_table "parts", :force => true do |t|
    t.decimal  "preis",        :precision => 7, :scale => 2
    t.text     "beschreibung"
    t.string   "produktbild"
    t.string   "name"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.boolean  "isProduct",                                  :default => false, :null => false
  end

  create_table "parts_consists_of_parts", :primary_key => "oberteilID", :force => true do |t|
    t.integer  "unterteilID"
    t.integer  "menge"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "parts_consists_of_parts", ["oberteilID", "unterteilID"], :name => "sqlite_autoindex_parts_consists_of_parts_1", :unique => true

end
