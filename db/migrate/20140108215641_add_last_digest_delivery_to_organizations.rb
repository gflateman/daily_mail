class AddLastDigestDeliveryToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :last_digest_delivery, :datetime, :default => Time.now
  end
end
