class AddSlugsToCollectionsAndResources < ActiveRecord::Migration
  def up
    add_column :collections, :slug, :string
    add_column :resources, :slug, :string

    add_index :collections, :slug, unique: true
    add_index :resources, :slug, unique: true

    Collection.find_each(&:save)
    Resource.find_each(&:save)
  end

  def down
    remove_index :collections, :slug
    remove_index :resources, :slug

    remove_column :collections, :slug
    remove_column :resources, :slug
  end
end
