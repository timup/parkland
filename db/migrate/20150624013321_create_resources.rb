class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :href

      t.timestamps null: false
    end
  end
end
