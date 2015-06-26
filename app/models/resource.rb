class Resource < ActiveRecord::Base

  has_many :resource_collections
  has_many :collections, through: :resource_collections

  def to_s
    name
  end
end
