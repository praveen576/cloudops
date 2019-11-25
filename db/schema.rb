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

ActiveRecord::Schema.define(version: 20191125163240) do

  create_table "cloud_services_providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 20
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_term_poduct_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "offer_term_product_id"
    t.string "attr_name", limit: 20
    t.string "attr_val"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_term_product_id"], name: "index_offer_term_poduct_attributes_on_offer_term_product_id"
  end

  create_table "offer_term_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "offer_term_id"
    t.bigint "product_id"
    t.datetime "effective_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_term_id"], name: "index_offer_term_products_on_offer_term_id"
    t.index ["product_id"], name: "index_offer_term_products_on_product_id"
  end

  create_table "offer_terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "offer_id"
    t.bigint "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "offer_term_code", limit: 20
    t.index ["offer_id"], name: "index_offer_terms_on_offer_id"
    t.index ["term_id"], name: "index_offer_terms_on_term_id"
  end

  create_table "offers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "offer_code"
    t.string "version"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "attr_name", limit: 20
    t.string "attr_val"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "product_families", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "sku", limit: 20
    t.bigint "product_family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "service_code", limit: 20
    t.index ["product_family_id"], name: "index_products_on_product_family_id"
  end

  create_table "rate_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "offer_term_product_id"
    t.string "rate_code"
    t.string "description"
    t.string "begin_range"
    t.string "end_range"
    t.bigint "service_unit_id"
    t.bigint "currency_id"
    t.float "price_per_unit", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_rate_infos_on_currency_id"
    t.index ["offer_term_product_id"], name: "index_rate_infos_on_offer_term_product_id"
    t.index ["service_unit_id"], name: "index_rate_infos_on_service_unit_id"
  end

  create_table "service_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 20
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
