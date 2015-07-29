class AddOrganizationToResources < ActiveRecord::Migration
  def change
    add_column :resources, :organization, :string
    add_column :resources, :org_href, :string
    add_column :resources, :org_description, :text
  end
end
