class ResourceCollection < ActiveRecord::Base
  belongs_to :resource
  belongs_to :collection
end
