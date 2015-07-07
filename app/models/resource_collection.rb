class ResourceCollection < ActiveRecord::Base
  belongs_to :resource
  belongs_to :collection

  acts_as_list scope: :collection
end
