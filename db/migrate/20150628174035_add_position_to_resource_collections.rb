class AddPositionToResourceCollections < ActiveRecord::Migration
  def change
    add_column :resource_collections, :position, :integer
  end
end
