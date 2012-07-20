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

ActiveRecord::Schema.define(:version => 20120227222636) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "playlist_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "state"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "picurl"
  end

  create_table "messages", :force => true do |t|
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "msg"
    t.integer  "show_id"
  end

  create_table "playlistables", :force => true do |t|
    t.integer  "playlist_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlists", :force => true do |t|
    t.integer  "show_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "m3u_file_name"
    t.string   "m3u_content_type"
    t.integer  "m3u_file_size"
    t.datetime "m3u_updated_at"
  end

  create_table "points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "q"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "request_ips", :force => true do |t|
    t.string   "ip"
    t.integer  "song_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "host"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "location_id"
    t.string   "station"
    t.text     "about"
    t.string   "topic"
    t.boolean  "requests_enabled"
    t.boolean  "fm"
    t.boolean  "am"
    t.boolean  "questions_enabled"
    t.string   "stream_mp3"
  end

  add_index "shows", ["email"], :name => "index_shows_on_email", :unique => true
  add_index "shows", ["reset_password_token"], :name => "index_shows_on_reset_password_token", :unique => true

  create_table "song_requests", :force => true do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.integer  "show_id"
    t.integer  "hitcount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", :force => true do |t|
    t.string   "email"
    t.string   "favstation"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "point_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
