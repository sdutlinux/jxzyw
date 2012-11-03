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

ActiveRecord::Schema.define(:version => 7) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "network_courses", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "department"
    t.string   "charge_person"
    t.integer  "category_id"
    t.string   "order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "professional_constructions", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "college"
    t.integer  "category_id"
    t.string   "phone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "quality_courses", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "department"
    t.string   "charge_person"
    t.string   "course_level"
    t.integer  "category_id"
    t.string   "year"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "college"
    t.integer  "category_id"
    t.string   "charge_people"
    t.string   "desc"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "teaching_achievements", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "department"
    t.string   "charge_person"
    t.integer  "category_id"
    t.string   "level"
    t.string   "year"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
