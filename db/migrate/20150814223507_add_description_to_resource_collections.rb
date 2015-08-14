class AddDescriptionToResourceCollections < ActiveRecord::Migration
  def change
    add_column :resource_collections, :description, :text
  end
end
