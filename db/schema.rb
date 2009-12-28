# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091228064440) do

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "offenders", :force => true do |t|
    t.string   "tid"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "middle"
    t.string   "address"
    t.string   "city"
    t.string   "target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "menu"
    t.string   "slug"
    t.text     "body"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "excerpt"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "fullname"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles"
  end

  create_table "wanteds", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "alias"
    t.string   "race"
    t.string   "sex"
    t.string   "eyes"
    t.string   "hair"
    t.string   "height"
    t.string   "weight"
    t.string   "other"
    t.string   "marks"
    t.string   "charges"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mug_file_name"
    t.string   "mug_content_type"
    t.integer  "mug_file_size"
    t.datetime "mug_updated_at"
  end

end
