  class User < ActiveRecord::Base
  include Slug

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :alphabetical, -> { order(:name) }
  scope :featured, ->(limit=5) { where.not(featured_at: nil).order(featured_at: :desc).limit(limit) }

  mount_uploader :image, ImageUploader

  has_many :collections
  has_many :resources

  validates :email, presence: true
  validates :name, presence: true

  def to_s
    name
  end

  def toggle_featured
    if featured_at.blank?
      touch(:featured_at)
    else
      update_attribute(:featured_at, nil)
    end
  end

end
