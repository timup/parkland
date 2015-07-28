class Resource < ActiveRecord::Base
  has_many :resource_collections, dependent: :destroy
  has_many :collections, through: :resource_collections

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  scope :person, -> { where(type: 'person') }
  scope :company, -> { where(type: 'company') }

  def to_s
    name
  end

  def resource_icon(resource)
    if resource.type = 'Company'
      return "fa-male"
    else
      return "fa-users"
    end
  end
end
