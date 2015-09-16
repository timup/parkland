class ResourceCollection < ActiveRecord::Base
  belongs_to :resource, counter_cache: :collections_count
  belongs_to :collection

  acts_as_list scope: :collection
end
