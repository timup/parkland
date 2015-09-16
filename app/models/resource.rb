class Resource < ActiveRecord::Base
  has_many :resource_collections, dependent: :destroy
  has_many :collections, through: :resource_collections

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  scope :top, ->(limit=5) { order(collections_count: :desc).limit(limit) }

  def to_s
    name
  end

  def image
    "forest.jpg"
  end

end
