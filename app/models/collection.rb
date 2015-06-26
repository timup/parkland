class Collection < ActiveRecord::Base
  has_many :resource_collections
  has_many :resources, through: :resource_collections

  accepts_nested_attributes_for :resources, reject_if: :all_blank, allow_destroy: true

  def to_s
    name
  end
end
