class RemoveOrgInfoFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :organization, :string
    remove_column :resources, :org_href, :string
    remove_column :resources, :org_description, :text
  end
end
