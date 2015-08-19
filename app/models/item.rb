class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships

  has_many :wants , class_name: "Want" , foreign_key: "item_id"
  has_many :want_user , through: :wants , source: :user
  
  has_many :haves , class_name: "Have" , foreign_key: "item_id"
  has_many :have_user , through: :haves , source: :user

  # has_many :wants , class_name: "Want", foreign_key: "user_id", dependent: :destroy
  # has_many :want_items , through: :wants, source: :item
  
  # has_many :haves , class_name: "Have" , foreign_key: "user_id", dependent: :destroy
  # has_many :have_items , through: :haves , source: :item
end
