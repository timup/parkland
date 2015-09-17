class AddImageToUsersCollectionsAndResources < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :collections, :image, :string
    add_column :resources, :image, :string
  end
end
