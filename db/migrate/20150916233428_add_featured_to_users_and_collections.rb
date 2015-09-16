class AddFeaturedToUsersAndCollections < ActiveRecord::Migration
  def change
    add_column :collections, :featured_at, :datetime
    add_column :users, :featured_at, :datetime
  end
end
