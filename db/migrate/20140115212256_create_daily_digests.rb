class CreateDailyDigests < ActiveRecord::Migration
  def change
    create_table :daily_digests do |t|
      t.integer :organization_id

      t.timestamps
    end
  end
end
