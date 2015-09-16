class User < ActiveRecord::Base
  include Slug

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :featured, ->(limit=5) { where.not(featured_at: nil).order(featured_at: :desc).limit(limit) }

  has_many :collections
  has_many :resources

  def to_s
    name
  end

  def image
    "gradient.png"
  end
end
