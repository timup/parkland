class User < ActiveRecord::Base
  include Slug

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collections
  has_many :resources

  def to_s
    name
  end

  def image
    "gradient.png"
  end
end
