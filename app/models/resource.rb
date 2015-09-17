class Resource < ActiveRecord::Base
  include Slug

  has_many :resource_collections, dependent: :destroy
  has_many :collections, through: :resource_collections

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  scope :top, ->(limit=5) { order(collections_count: :desc).limit(limit) }

  mount_uploader :image, ImageUploader

  def to_s
    name
  end
  
end
