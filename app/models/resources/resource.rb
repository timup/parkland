class Resource < ActiveRecord::Base
  has_many :resource_collections, dependent: :destroy
  has_many :collections, through: :resource_collections

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  def to_s
    name
  end

end
