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

ActiveRecord::Schema.define(:version => 20120508185343) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collabs", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "collabs", ["project_id", "user_id"], :name => "index_collabs_on_project_id_and_user_id", :unique => true
  add_index "collabs", ["project_id"], :name => "index_collabs_on_project_id"
  add_index "collabs", ["user_id"], :name => "index_collabs_on_user_id"

  create_table "commenthrds", :force => true do |t|
    t.integer  "thrd_id"
    t.integer  "user_id"
    t.string   "comment",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "commenthrds", ["thrd_id"], :name => "index_commenthrds_on_thrd_id"

  create_table "comments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "content",    :default => ""
  end

  add_index "comments", ["project_id", "created_at"], :name => "index_comments_on_project_id_and_created_at"

  create_table "conversations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "interlocutor_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "conversations", ["interlocutor_id"], :name => "index_conversations_on_interlocutor_id"
  add_index "conversations", ["user_id", "interlocutor_id"], :name => "index_conversations_on_user_id_and_interlocutor_id", :unique => true
  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "ideas", :force => true do |t|
    t.integer  "user_id"
    t.string   "thought",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "ideas", ["user_id", "created_at"], :name => "index_ideas_on_user_id_and_created_at"

  create_table "inspirations", :force => true do |t|
    t.string   "content",      :default => ""
    t.text     "content_html", :default => ""
    t.integer  "user_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "inspirations", ["user_id", "created_at"], :name => "index_inspirations_on_user_id_and_created_at"

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["project_id"], :name => "index_likes_on_project_id"
  add_index "likes", ["user_id", "project_id"], :name => "index_likes_on_user_id_and_project_id", :unique => true
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "lines", :force => true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "text",            :default => ""
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "needs", :force => true do |t|
    t.integer  "project_id"
    t.string   "description"
    t.boolean  "got"
    t.integer  "type"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "title"
    t.string   "reward",      :default => ""
    t.string   "place",       :default => ""
    t.boolean  "anywhere",    :default => true
  end

  add_index "needs", ["project_id", "created_at"], :name => "index_needs_on_project_id_and_created_at"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description",        :limit => 255
    t.string   "cover",                             :default => ""
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.boolean  "profitable",                        :default => false
    t.integer  "category_id",                       :default => 1
    t.string   "tags",                              :default => ""
    t.boolean  "online",                            :default => true
    t.string   "place",                             :default => ""
    t.boolean  "finished",                          :default => false
    t.integer  "likes_count",                       :default => 0
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "projects", ["category_id"], :name => "index_projects_on_category"
  add_index "projects", ["profitable"], :name => "index_projects_on_profitable"
  add_index "projects", ["user_id", "created_at"], :name => "index_projects_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "resources", :force => true do |t|
    t.string   "content"
    t.integer  "project_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.text     "content_html", :limit => 255, :default => ""
  end

  add_index "resources", ["project_id"], :name => "index_resources_on_project_id"

  create_table "tag_rels", :force => true do |t|
    t.integer  "project_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_rels", ["project_id", "tag_id"], :name => "index_tag_rels_on_project_id_and_tag_id", :unique => true
  add_index "tag_rels", ["project_id"], :name => "index_tag_rels_on_project_id"
  add_index "tag_rels", ["tag_id"], :name => "index_tag_rels_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "phrase"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["phrase"], :name => "index_tags_on_phrase", :unique => true

  create_table "tasks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "description", :default => ""
    t.integer  "responsible"
    t.date     "deadline"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "done",        :default => false
  end

  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"

  create_table "thrds", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "title",      :default => ""
    t.string   "content",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "thrds", ["project_id"], :name => "index_thrds_on_project_id"
  add_index "thrds", ["user_id"], :name => "index_thrds_on_user_id"

  create_table "updates", :force => true do |t|
    t.integer  "project_id"
    t.string   "content",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "updates", ["project_id"], :name => "index_updates_on_project_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.string   "place"
    t.string   "webpage"
    t.string   "whatido"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
