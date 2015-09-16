class AddCollectionsCounterCacheToResources < ActiveRecord::Migration
  def up
    add_column :resources, :collections_count, :integer, default: 0, null: false
    Resource.find_each do |res|
      Resource.reset_counters(res.id, :collections)
    end
  end

  def down
    remove_column :resources, :collections_count
  end
end
