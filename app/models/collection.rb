class Collection < ActiveRecord::Base
  include Slug
  include ActionView::Helpers #for #small_description

  has_many :resource_collections, dependent: :destroy
  has_many :resources, through: :resource_collections

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  scope :featured, ->(limit=5) { where.not(featured_at: nil).order(featured_at: :desc).limit(limit) }

  def to_s
    name
  end

  def image
    'forest.jpg'
  end

  def small_description
    truncate(description, length: 56)
  end
end
