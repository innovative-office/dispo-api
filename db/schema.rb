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

ActiveRecord::Schema.define(version: 20161010212915) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id",           limit: 4
    t.string  "street",                limit: 255
    t.string  "postal_code",           limit: 255
    t.string  "city",                  limit: 255
    t.string  "country",               limit: 255
    t.integer "category_id",           limit: 4
    t.integer "created_by",            limit: 4
    t.integer "updated_by",            limit: 4
    t.integer "delivery_rejection_id", limit: 4
    t.integer "referee_id",            limit: 4
    t.string  "company_name",          limit: 255
    t.string  "code",                  limit: 255
    t.string  "eori",                  limit: 255
  end

  add_index "addresses", ["category_id"], name: "index_addresses_on_category_id", using: :btree
  add_index "addresses", ["code"], name: "index_addresses_on_code", using: :btree
  add_index "addresses", ["company_name"], name: "index_addresses_on_company_name", using: :btree
  add_index "addresses", ["country"], name: "index_addresses_on_country", using: :btree
  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  add_index "addresses", ["eori"], name: "index_addresses_on_eori", using: :btree

  create_table "article_groups", force: :cascade do |t|
    t.text     "description",    limit: 65535
    t.integer  "warn_on",        limit: 4
    t.integer  "baan_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "warn_on_price",  limit: 255
    t.string   "stocktaking_id", limit: 255
  end

  create_table "article_position_time_shifting_assignments", force: :cascade do |t|
    t.integer  "article_position_id",           limit: 4
    t.integer  "time_shifting_id",              limit: 4
    t.integer  "created_by",                    limit: 4
    t.integer  "updated_by",                    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_number",                  limit: 255
    t.date     "confirmed_date"
    t.string   "purchase_positions_collection", limit: 255
  end

  create_table "article_positions", force: :cascade do |t|
    t.string   "baan_id",    limit: 255
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "baan_acces_id",                 limit: 255
    t.string   "article_code",                  limit: 255
    t.integer  "depot_id",                      limit: 4
    t.integer  "article_type",                  limit: 4
    t.string   "signal_code_description",       limit: 255
    t.string   "description",                   limit: 255
    t.string   "search_key_01",                 limit: 255
    t.string   "search_key_02",                 limit: 255
    t.string   "material",                      limit: 255
    t.string   "factor",                        limit: 255
    t.string   "zone_code",                     limit: 255
    t.string   "stock_unit",                    limit: 255
    t.string   "order_unit",                    limit: 255
    t.string   "trade_partner_name",            limit: 255
    t.string   "trade_partner_additional_info", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rack_group_number",             limit: 255
    t.string   "rack_root_number",              limit: 255
    t.string   "rack_part_number",              limit: 255
    t.string   "rack_tray_number",              limit: 255
    t.string   "rack_box_number",               limit: 255
    t.string   "in_stock",                      limit: 255
    t.string   "old_stock",                     limit: 255
    t.integer  "article_group_id",              limit: 4
    t.decimal  "price",                                     precision: 12, scale: 2
    t.boolean  "should_be_checked"
    t.string   "baan_orno",                     limit: 255
    t.string   "baan_cntn",                     limit: 255
    t.string   "baan_pono",                     limit: 255
    t.string   "baan_loca",                     limit: 255
    t.string   "baan_clot",                     limit: 255
    t.string   "baan_qstk",                     limit: 255
    t.string   "baan_qstr",                     limit: 255
    t.string   "baan_csts",                     limit: 255
    t.string   "baan_recd",                     limit: 255
    t.string   "baan_item",                     limit: 255
    t.string   "baan_date",                     limit: 255
    t.string   "baan_stun",                     limit: 255
    t.string   "baan_reco",                     limit: 255
    t.string   "baan_appr",                     limit: 255
    t.string   "baan_cadj",                     limit: 255
    t.boolean  "considered"
    t.string   "baan_vstk",                     limit: 255
    t.string   "baan_vstr",                     limit: 255
    t.string   "baan_cstk",                     limit: 255
    t.string   "baan_cstr",                     limit: 255
    t.string   "rack_root_part_number",         limit: 255
    t.string   "stocktaking_id",                limit: 255
  end

  create_table "baan_import_groups", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baan_imports", force: :cascade do |t|
    t.integer  "baan_import_group_id",     limit: 4
    t.date     "importing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "baan_upload_file_name",    limit: 255
    t.string   "baan_upload_content_type", limit: 255
    t.integer  "baan_upload_file_size",    limit: 4
    t.datetime "baan_upload_updated_at"
  end

  create_table "baan_raw_data", force: :cascade do |t|
    t.integer  "baan_import_id", limit: 4
    t.string   "baan_0",         limit: 50
    t.string   "baan_1",         limit: 50
    t.string   "baan_2",         limit: 50
    t.string   "baan_3",         limit: 50
    t.string   "baan_4",         limit: 50
    t.string   "baan_5",         limit: 50
    t.string   "baan_6",         limit: 50
    t.string   "baan_7",         limit: 50
    t.string   "baan_8",         limit: 50
    t.string   "baan_9",         limit: 50
    t.string   "baan_10",        limit: 50
    t.string   "baan_11",        limit: 50
    t.string   "baan_12",        limit: 50
    t.string   "baan_13",        limit: 50
    t.string   "baan_14",        limit: 50
    t.string   "baan_15",        limit: 50
    t.string   "baan_16",        limit: 50
    t.string   "baan_17",        limit: 50
    t.string   "baan_18",        limit: 50
    t.string   "baan_19",        limit: 50
    t.string   "baan_20",        limit: 50
    t.string   "baan_21",        limit: 50
    t.string   "baan_22",        limit: 50
    t.string   "baan_23",        limit: 50
    t.string   "baan_24",        limit: 50
    t.string   "baan_25",        limit: 50
    t.string   "baan_26",        limit: 50
    t.string   "baan_27",        limit: 50
    t.string   "baan_28",        limit: 50
    t.string   "baan_29",        limit: 50
    t.string   "baan_30",        limit: 50
    t.string   "baan_31",        limit: 50
    t.string   "baan_32",        limit: 50
    t.string   "baan_33",        limit: 50
    t.string   "baan_34",        limit: 50
    t.string   "baan_35",        limit: 50
    t.string   "baan_36",        limit: 50
    t.string   "baan_37",        limit: 50
    t.string   "baan_38",        limit: 50
    t.string   "baan_39",        limit: 50
    t.string   "baan_40",        limit: 50
    t.string   "baan_41",        limit: 50
    t.string   "baan_42",        limit: 50
    t.string   "baan_43",        limit: 50
    t.string   "baan_44",        limit: 50
    t.string   "baan_45",        limit: 50
    t.string   "baan_46",        limit: 50
    t.string   "baan_47",        limit: 50
    t.string   "baan_48",        limit: 50
    t.string   "baan_49",        limit: 50
    t.string   "baan_50",        limit: 50
    t.string   "baan_51",        limit: 50
    t.string   "baan_52",        limit: 50
    t.string   "baan_53",        limit: 50
    t.string   "baan_54",        limit: 50
    t.string   "baan_55",        limit: 50
    t.string   "baan_56",        limit: 50
    t.string   "baan_57",        limit: 50
    t.string   "baan_58",        limit: 50
    t.string   "baan_59",        limit: 50
    t.string   "baan_60",        limit: 50
    t.string   "baan_61",        limit: 50
    t.string   "baan_62",        limit: 50
    t.string   "baan_63",        limit: 50
    t.string   "baan_64",        limit: 50
    t.string   "baan_65",        limit: 50
    t.string   "baan_66",        limit: 50
    t.string   "baan_67",        limit: 50
    t.string   "baan_68",        limit: 50
    t.string   "baan_69",        limit: 50
    t.string   "baan_70",        limit: 50
    t.string   "baan_71",        limit: 50
    t.string   "baan_72",        limit: 50
    t.string   "baan_73",        limit: 50
    t.string   "baan_74",        limit: 50
    t.string   "baan_75",        limit: 50
    t.string   "baan_76",        limit: 50
    t.string   "baan_77",        limit: 50
    t.string   "baan_78",        limit: 50
    t.string   "baan_79",        limit: 50
    t.string   "baan_80",        limit: 50
    t.string   "baan_81",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "baan_82",        limit: 50
    t.string   "baan_83",        limit: 50
    t.string   "baan_84",        limit: 50
    t.string   "baan_85",        limit: 50
    t.string   "baan_86",        limit: 50
    t.string   "baan_87",        limit: 50
    t.string   "baan_88",        limit: 20
    t.string   "baan_89",        limit: 255, default: ""
  end

  create_table "calculations", force: :cascade do |t|
    t.integer  "total_pallets",            limit: 4,   default: 0
    t.integer  "total_purchase_positions", limit: 4,   default: 0
    t.integer  "calculable_id",            limit: 4
    t.string   "calculable_type",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargo_list_delivery_rejection_assignments", force: :cascade do |t|
    t.integer  "delivery_rejection_id", limit: 4
    t.integer  "cargo_list_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargo_lists", force: :cascade do |t|
    t.datetime "pick_up_time_earliest"
    t.datetime "pick_up_time_latest"
    t.integer  "shipper_id",            limit: 4
    t.integer  "shipper_location_id",   limit: 4
    t.integer  "customer_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "delivered",                         default: false
    t.string   "referee",               limit: 255
    t.string   "country",               limit: 255
    t.integer  "pallets_count",         limit: 4,   default: 0
    t.integer  "level_3",               limit: 4
    t.string   "eori",                  limit: 255
    t.string   "tax_number",            limit: 255
    t.string   "delivery_city",         limit: 255
    t.string   "delivery_zip",          limit: 255
    t.string   "delivery_street",       limit: 255
    t.string   "delivery_country",      limit: 255
    t.string   "delivery_warehouse",    limit: 255
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.string   "categorizable_type", limit: 255
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "subject",          limit: 255
    t.text     "content",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.integer  "created_by",       limit: 4
    t.integer  "updated_by",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commodity_codes", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.text     "title",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "company",    limit: 255
    t.string   "referee",    limit: 255
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "baan_id",    limit: 255
  end

  create_table "delivery_dates", force: :cascade do |t|
    t.date     "date_of_delivery"
    t.integer  "dateable_id",      limit: 4
    t.string   "dateable_type",    limit: 255
    t.integer  "created_by",       limit: 4
    t.integer  "updated_by",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_rejections", force: :cascade do |t|
    t.integer  "customer_id",         limit: 4
    t.integer  "referee_id",          limit: 4
    t.integer  "address_id",          limit: 4
    t.integer  "category_id",         limit: 4
    t.integer  "status_id",           limit: 4
    t.integer  "created_by",          limit: 4
    t.integer  "updated_by",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cargo_list_id",       limit: 4
    t.float    "discount",            limit: 24
    t.boolean  "closed",                         default: false
    t.integer  "delivery_address_id", limit: 4
    t.integer  "pick_up_address_id",  limit: 4
    t.integer  "invoice_address_id",  limit: 4
  end

  create_table "department_shifting_reason_assignments", force: :cascade do |t|
    t.integer  "department_id",      limit: 4
    t.integer  "shifting_reason_id", limit: 4
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "department_time_shifting_assignments", force: :cascade do |t|
    t.integer  "time_shifting_id", limit: 4
    t.integer  "department_id",    limit: 4
    t.integer  "created_by",       limit: 4
    t.integer  "updated_by",       limit: 4
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "department_user_assignments", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "department_id", limit: 4
    t.integer  "created_by",    limit: 4
    t.integer  "updated_by",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation", limit: 255
  end

  create_table "depot_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "depots", force: :cascade do |t|
    t.integer  "code",           limit: 4
    t.text     "description",    limit: 65535
    t.integer  "depot_type_id",  limit: 4
    t.string   "address_code",   limit: 255
    t.string   "phone_number",   limit: 255
    t.string   "fax_number",     limit: 255
    t.string   "web_address",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stocktaking_id", limit: 255
  end

  create_table "html_contents", force: :cascade do |t|
    t.text    "code",                 limit: 65535
    t.integer "purchase_order_id",    limit: 4
    t.integer "purchase_position_id", limit: 4
    t.integer "category_id",          limit: 4
    t.integer "pallet_id",            limit: 4
  end

  create_table "microsoft_database_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microsoft_databases", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "database_type_id", limit: 4
    t.string   "file",             limit: 255
    t.string   "file_directory",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pallet_purchase_position_assignments", force: :cascade do |t|
    t.integer  "pallet_id",             limit: 4
    t.integer  "purchase_position_id",  limit: 4
    t.integer  "quantity",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",                          precision: 12, scale: 2
    t.decimal  "weight",                          precision: 12, scale: 2
    t.decimal  "reduced_price",                   precision: 12, scale: 2
    t.decimal  "gross_price",                     precision: 12, scale: 2
    t.decimal  "net_price",                       precision: 12, scale: 2
    t.decimal  "value_discount",                  precision: 12, scale: 2
    t.boolean  "is_individual_package",                                    default: false
    t.integer  "variant_id",            limit: 4
  end

  create_table "pallet_types", force: :cascade do |t|
    t.string  "description", limit: 255
    t.float   "count_as",    limit: 24
    t.string  "read_as",     limit: 255
    t.decimal "weight",                  precision: 12, scale: 2, default: 0.0
  end

  create_table "pallets", force: :cascade do |t|
    t.integer "cargo_list_id",         limit: 4
    t.float   "additional_space",      limit: 24, default: 0.0
    t.integer "pallet_type_id",        limit: 4
    t.boolean "delivered",                        default: false
    t.integer "delivery_rejection_id", limit: 4
    t.integer "shipping_address_id",   limit: 4
    t.integer "zip_location_id",       limit: 4
    t.boolean "mixed",                            default: false
    t.integer "shipping_route_id",     limit: 4
    t.integer "line_items_quantity",   limit: 4,  default: 0
  end

  create_table "pdf_reports", force: :cascade do |t|
    t.string   "pdf_type",         limit: 255
    t.integer  "user_id",          limit: 4
    t.string   "searched_for",     limit: 255
    t.string   "report_file_name", limit: 255
    t.string   "report_file_path", limit: 255
    t.boolean  "saved_local"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printable_media", force: :cascade do |t|
    t.string "title", limit: 255
  end

  create_table "printable_media_shipping_route_assignments", force: :cascade do |t|
    t.integer "printable_media_id", limit: 4
    t.integer "shipping_route_id",  limit: 4
  end

  create_table "purchase_invoices", force: :cascade do |t|
    t.string   "category",             limit: 20
    t.string   "purchase_position_id", limit: 50
    t.string   "baan_id",              limit: 50
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "cargo_list_id",        limit: 4
  end

  create_table "purchase_order_address_assignments", force: :cascade do |t|
    t.integer  "purchase_order_id", limit: 4
    t.integer  "address_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_pallet_assignments", force: :cascade do |t|
    t.integer  "purchase_order_id", limit: 4
    t.integer  "pallet_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "customer_id",             limit: 4
    t.string   "baan_id",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipping_route_id",       limit: 4
    t.date     "delivery_date"
    t.boolean  "delivered",                           default: false
    t.integer  "address_id",              limit: 4
    t.integer  "level_1",                 limit: 4
    t.integer  "level_2",                 limit: 4
    t.integer  "shipping_address_id",     limit: 4
    t.integer  "stock_status",            limit: 4,   default: 0
    t.integer  "production_status",       limit: 4,   default: 0
    t.string   "workflow_status",         limit: 255, default: "00"
    t.float    "manufacturing_completed", limit: 24,  default: 0.0
    t.float    "warehousing_completed",   limit: 24,  default: 0.0
    t.integer  "warehouse_number",        limit: 4,   default: 0
    t.integer  "category_id",             limit: 4
    t.integer  "priority_level",          limit: 4,   default: 1
    t.boolean  "picked_up",                           default: false
    t.integer  "pending_status",          limit: 4,   default: 0
    t.boolean  "cancelled",                           default: false
    t.string   "additional_1",            limit: 50
    t.string   "additional_2",            limit: 50
    t.string   "additional_3",            limit: 50
  end

  add_index "purchase_orders", ["baan_id"], name: "index_purchase_orders_on_baan_id", unique: true, using: :btree
  add_index "purchase_orders", ["cancelled"], name: "index_purchase_orders_on_cancelled", using: :btree
  add_index "purchase_orders", ["category_id"], name: "index_purchase_orders_on_category_id", using: :btree
  add_index "purchase_orders", ["delivered"], name: "index_purchase_orders_on_delivered", using: :btree
  add_index "purchase_orders", ["level_1"], name: "index_purchase_orders_on_level_1", using: :btree
  add_index "purchase_orders", ["level_2"], name: "index_purchase_orders_on_level_2", using: :btree
  add_index "purchase_orders", ["pending_status"], name: "index_purchase_orders_on_pending_status", using: :btree
  add_index "purchase_orders", ["picked_up"], name: "index_purchase_orders_on_picked_up", using: :btree
  add_index "purchase_orders", ["priority_level"], name: "index_purchase_orders_on_priority_level", using: :btree
  add_index "purchase_orders", ["production_status"], name: "index_purchase_orders_on_production_status", using: :btree
  add_index "purchase_orders", ["shipping_address_id"], name: "index_purchase_orders_on_shipping_address_id", using: :btree
  add_index "purchase_orders", ["shipping_route_id"], name: "index_purchase_orders_on_shipping_route_id", using: :btree
  add_index "purchase_orders", ["stock_status"], name: "index_purchase_orders_on_stock_status", using: :btree
  add_index "purchase_orders", ["warehouse_number"], name: "index_purchase_orders_on_warehouse_number", using: :btree

  create_table "purchase_position_time_shifting_assignments", force: :cascade do |t|
    t.integer  "purchase_position_id", limit: 4
    t.integer  "time_shifting_id",     limit: 4
    t.boolean  "considered"
    t.integer  "created_by",           limit: 4
    t.integer  "updated_by",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_positions", force: :cascade do |t|
    t.integer  "purchase_order_id",  limit: 4
    t.integer  "commodity_code_id",  limit: 4
    t.decimal  "weight_single",                  precision: 12, scale: 2
    t.decimal  "weight_total",                   precision: 12, scale: 2
    t.integer  "quantity",           limit: 4
    t.decimal  "amount",                         precision: 12, scale: 2
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",           limit: 4
    t.integer  "pallet_id",          limit: 4
    t.string   "product_line",       limit: 255
    t.string   "article",            limit: 255
    t.string   "storage_location",   limit: 255
    t.string   "article_number",     limit: 255
    t.decimal  "total_amount",                   precision: 12, scale: 2
    t.boolean  "delivered",                                               default: false
    t.integer  "zip_location_id",    limit: 4
    t.string   "baan_id",            limit: 255
    t.decimal  "gross_price",                    precision: 12, scale: 2
    t.decimal  "net_price",                      precision: 12, scale: 2
    t.decimal  "value_discount",                 precision: 12, scale: 2
    t.integer  "production_status",  limit: 4,                            default: 0
    t.integer  "stock_status",       limit: 4,                            default: 0
    t.integer  "priority_level",     limit: 4,                            default: 1
    t.boolean  "picked_up",                                               default: false
    t.boolean  "cancelled",                                               default: false
    t.integer  "level_3",            limit: 4
    t.integer  "shipping_route_id",  limit: 4
    t.string   "additional_1",       limit: 50
    t.string   "additional_2",       limit: 50
    t.string   "additional_3",       limit: 50
    t.decimal  "volume",                         precision: 12, scale: 2, default: 0.0
    t.integer  "available_quantity", limit: 4,                            default: 0
    t.integer  "in_store_qty",       limit: 4,                            default: 0
  end

  add_index "purchase_positions", ["baan_id"], name: "index_purchase_positions_on_baan_id", using: :btree
  add_index "purchase_positions", ["commodity_code_id"], name: "index_purchase_positions_on_commodity_code_id", using: :btree
  add_index "purchase_positions", ["level_3"], name: "index_purchase_positions_on_level_3", using: :btree
  add_index "purchase_positions", ["shipping_route_id"], name: "index_purchase_positions_on_shipping_route_id", using: :btree
  add_index "purchase_positions", ["storage_location"], name: "index_purchase_positions_on_storage_location", using: :btree
  add_index "purchase_positions", ["zip_location_id"], name: "index_purchase_positions_on_zip_location_id", using: :btree

  create_table "referees", force: :cascade do |t|
    t.integer  "customer_id",  limit: 4
    t.string   "forename",     limit: 255
    t.string   "surname",      limit: 255
    t.string   "phone_number", limit: 255
    t.string   "email",        limit: 255
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "position",   limit: 4
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifting_reason_time_shifting_assignments", force: :cascade do |t|
    t.integer  "time_shifting_id",   limit: 4
    t.integer  "shifting_reason_id", limit: 4
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifting_reasons", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipper_locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shippers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "street",       limit: 255
    t.integer  "zip",          limit: 4
    t.string   "city",         limit: 255
    t.string   "country",      limit: 255
    t.string   "fax",          limit: 255
    t.string   "phone_number", limit: 255
    t.integer  "customer_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_routes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
    t.integer  "created_by",      limit: 4
    t.integer  "updated_by",      limit: 4
    t.string   "statusable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_shiftings", force: :cascade do |t|
    t.boolean  "simple"
    t.string   "purchase_order_id",     limit: 255
    t.date     "delivery_date"
    t.integer  "created_by",            limit: 4
    t.integer  "updated_by",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id",         limit: 4
    t.boolean  "customer_was_informed"
    t.boolean  "baan_was_updated"
    t.date     "we_date"
    t.date     "lt_date"
    t.boolean  "change_we_date"
    t.boolean  "change_lt_date"
    t.boolean  "closed",                            default: false
  end

  create_table "transport_issues", force: :cascade do |t|
    t.integer  "purchase_position_id",  limit: 4
    t.integer  "delivery_rejection_id", limit: 4
    t.integer  "created_by",            limit: 4
    t.integer  "updated_by",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_role_assignments", id: false, force: :cascade do |t|
    t.integer  "role_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "forename",               limit: 255
    t.string   "surname",                limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "variants", force: :cascade do |t|
    t.string   "purchase_position_id", limit: 255
    t.string   "purchase_order_id",    limit: 255
    t.decimal  "weight_single",                    precision: 12, scale: 2
    t.decimal  "weight_total",                     precision: 12, scale: 2
    t.decimal  "amount",                           precision: 12, scale: 2
    t.decimal  "total_amount",                     precision: 12, scale: 2
    t.decimal  "gross_price",                      precision: 12, scale: 2
    t.decimal  "net_price",                        precision: 12, scale: 2
    t.decimal  "value_discount",                   precision: 12, scale: 2
    t.string   "commodity_code_id",    limit: 255
    t.string   "shipping_route_id",    limit: 255
    t.string   "zip_location_id",      limit: 255
    t.string   "level_3",              limit: 255
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.decimal  "volume",                           precision: 12, scale: 2, default: 0.0
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,   null: false
    t.integer  "item_id",    limit: 4,     null: false
    t.string   "event",      limit: 255,   null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 65535
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "zip_locations", force: :cascade do |t|
    t.string "title", limit: 255
  end

end
