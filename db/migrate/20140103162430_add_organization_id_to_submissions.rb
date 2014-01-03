class AddOrganizationIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :organization_id, :integer
    add_index :submissions, :organization_id
  end
end
