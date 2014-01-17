class RemoveOrganizationIdFromSubmissions < ActiveRecord::Migration
  def change
    remove_index :submissions, :organization_id
    remove_column :submissions, :organization_id, :integer

    add_column :submissions, :daily_digest_id, :integer
    add_index :submissions, :daily_digest_id

    add_index :daily_digests, :organization_id

    remove_column :organizations, :last_digest_delivery, :datetime

    add_column :daily_digests, :delivered_at, :datetime

  end
end
