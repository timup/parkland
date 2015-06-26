class Collection < ActiveRecord::Base
  has_many :resource_collections
  has_many :resources, through: :resource_collections

  def to_s
    name
  end
end
