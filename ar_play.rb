# Instead of loading all of Rails, load the
# particular Rails dependencies we need
require 'sqlite3'
require 'active_record'

# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end
  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
    t.string   "preferences"
    t.string   "extra"
  end
end

# Set up model classes
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
class Comment < ApplicationRecord
  belongs_to :post
end
class Post < ApplicationRecord
  has_many :comments

  store :extra, accessors: [:raw_amount, :raw_currency, :raw_fee, :country_code, :chargeback, :pending_amount]
  serialize :preferences
end


# Try everything out!
post = Post.new
post.title = "We got a puppy!"
post.body = "Her name is Chai."
post.raw_amount = 100
post.preferences = { background: "black", display: "large" }
post.save
post.comments.create(content: "Awww.")
post.comments.create(content: "So cute!")
Post.find_each do |post|
  # p post.comments
  p post.raw_amount
  p post.preferences
end