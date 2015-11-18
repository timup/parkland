class Resource < ActiveRecord::Base
  include Slug

  has_many :resource_collections, dependent: :destroy
  has_many :collections, through: :resource_collections

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  scope :alphabetical, -> { order(:name) }
  scope :top, ->(limit=5) { order(collections_count: :desc).limit(limit) }

  validates_formatting_of :href, using: :url
  validates :name, presence: true
  validates :owner, presence: true
  validates :type, inclusion: {in: ["Person", "Company"], message: "must be a specific type"}

  mount_uploader :image, ImageUploader

  def to_s
    name
  end
  
end
