class CreateResourceCollections < ActiveRecord::Migration
  def change
    create_table :resource_collections do |t|
      t.references :resource, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
