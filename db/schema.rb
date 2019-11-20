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

ActiveRecord::Schema.define(version: 20191120052307) do

  create_table "alpha_alpha_defs", force: :cascade do |t|
    t.integer "dseq"
    t.string "dname"
    t.text "ddescription"
    t.integer "alpha_framework_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_framework_def_id"], name: "index_alpha_alpha_defs_on_alpha_framework_def_id"
  end

  create_table "alpha_alphas", force: :cascade do |t|
    t.integer "alpha_framework_id"
    t.integer "alpha_alpha_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_alpha_def_id"], name: "index_alpha_alphas_on_alpha_alpha_def_id"
    t.index ["alpha_framework_id"], name: "index_alpha_alphas_on_alpha_framework_id"
  end

  create_table "alpha_evidences", force: :cascade do |t|
    t.string "document"
    t.integer "alpha_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.datetime "completed_at"
    t.index ["alpha_item_id"], name: "index_alpha_evidences_on_alpha_item_id"
  end

  create_table "alpha_framework_defs", force: :cascade do |t|
    t.string "dname"
    t.text "ddescription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alpha_frameworks", force: :cascade do |t|
    t.integer "project_id"
    t.integer "alpha_framework_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_framework_def_id"], name: "index_alpha_frameworks_on_alpha_framework_def_id"
    t.index ["project_id"], name: "index_alpha_frameworks_on_project_id"
  end

  create_table "alpha_item_defs", force: :cascade do |t|
    t.integer "dseq"
    t.text "ddescription"
    t.integer "alpha_state_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_state_def_id"], name: "index_alpha_item_defs_on_alpha_state_def_id"
  end

  create_table "alpha_items", force: :cascade do |t|
    t.boolean "completed", default: false
    t.datetime "completed_at"
    t.integer "alpha_state_id"
    t.integer "alpha_item_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_item_def_id"], name: "index_alpha_items_on_alpha_item_def_id"
    t.index ["alpha_state_id"], name: "index_alpha_items_on_alpha_state_id"
  end

  create_table "alpha_state_defs", force: :cascade do |t|
    t.integer "dseq"
    t.string "dname"
    t.text "ddescription"
    t.integer "alpha_alpha_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_alpha_def_id"], name: "index_alpha_state_defs_on_alpha_alpha_def_id"
  end

  create_table "alpha_states", force: :cascade do |t|
    t.boolean "completed", default: false
    t.integer "completed_items", default: 0
    t.datetime "completed_at"
    t.integer "alpha_alpha_id"
    t.integer "alpha_state_def_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpha_alpha_id"], name: "index_alpha_states_on_alpha_alpha_id"
    t.index ["alpha_state_def_id"], name: "index_alpha_states_on_alpha_state_def_id"
  end

  create_table "backlog_items", force: :cascade do |t|
    t.integer "itemType"
    t.integer "no"
    t.integer "seq"
    t.date "create_at"
    t.string "dev_type"
    t.integer "state"
    t.integer "estimate"
    t.date "started_at"
    t.date "ended_at"
    t.string "description"
    t.string "supplement"
    t.string "priority"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "sprint_id"
    t.integer "backlog_item_id"
    t.integer "blog_author_id"
    t.integer "assign_to_id"
    t.index ["assign_to_id"], name: "index_backlog_items_on_assign_to_id"
    t.index ["backlog_item_id"], name: "index_backlog_items_on_backlog_item_id"
    t.index ["blog_author_id"], name: "index_backlog_items_on_blog_author_id"
    t.index ["project_id"], name: "index_backlog_items_on_project_id"
    t.index ["sprint_id"], name: "index_backlog_items_on_sprint_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.date "start"
    t.date "end"
    t.integer "length"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scrum_members", force: :cascade do |t|
    t.integer "role"
    t.text "description"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_scrum_members_on_project_id"
    t.index ["user_id"], name: "index_scrum_members_on_user_id"
  end

  create_table "sprint_diaries", force: :cascade do |t|
    t.integer "scrum_member_id"
    t.string "bdiary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scrum_member_id"], name: "index_sprint_diaries_on_scrum_member_id"
  end

  create_table "sprintdiaries", force: :cascade do |t|
    t.integer "surum_menber_id"
    t.string "bdiary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surum_menber_id"], name: "index_sprintdiaries_on_surum_menber_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.integer "no"
    t.text "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start"
    t.date "end"
    t.index ["no"], name: "index_sprints_on_no"
    t.index ["project_id"], name: "index_sprints_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
