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

ActiveRecord::Schema.define(version: 2018_08_27_091203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.float "percent"
    t.bigint "material_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_assemblies_on_item_id"
    t.index ["material_id"], name: "index_assemblies_on_material_id"
  end

  create_table "brand_reviews", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "source_id"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["brand_id"], name: "index_brand_reviews_on_brand_id"
    t.index ["source_id"], name: "index_brand_reviews_on_source_id"
  end

  create_table "brand_suscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_brand_suscriptions_on_brand_id"
    t.index ["user_id"], name: "index_brand_suscriptions_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "carbon_min"
    t.float "carbon_max"
    t.float "eutrophisation_min"
    t.float "eutrophisation_max"
    t.float "global_max"
    t.float "global_min"
    t.string "traduction"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.bigint "category_id"
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "carbonimpact"
    t.float "eutrophisation"
    t.boolean "recycled"
    t.text "comment"
    t.string "traduction"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.bigint "theme_id"
    t.text "description"
    t.integer "mark"
    t.index ["theme_id"], name: "index_sources_on_theme_id"
  end

  create_table "suscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_suscriptions_on_category_id"
    t.index ["user_id"], name: "index_suscriptions_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scope"
    t.text "icon"
    t.text "greencomment"
    t.text "orangecomment"
    t.text "redcomment"
    t.string "traduction"
    t.string "english_greencomment"
    t.string "english_redcomment"
    t.string "english_orangecomment"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assemblies", "items"
  add_foreign_key "assemblies", "materials"
  add_foreign_key "brand_reviews", "brands"
  add_foreign_key "brand_reviews", "sources"
  add_foreign_key "brand_suscriptions", "brands"
  add_foreign_key "brand_suscriptions", "users"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "sources", "themes"
  add_foreign_key "suscriptions", "categories"
  add_foreign_key "suscriptions", "users"
end
