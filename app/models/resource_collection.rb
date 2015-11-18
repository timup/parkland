class ResourceCollection < ActiveRecord::Base
  belongs_to :collection
  belongs_to :resource, counter_cache: :collections_count

  acts_as_list scope: :collection

  validates :collection, presence: true
  validates :resource, presence: true
end
