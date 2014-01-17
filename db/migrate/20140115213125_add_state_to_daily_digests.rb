class AddStateToDailyDigests < ActiveRecord::Migration
  def change
    add_column :daily_digests, :state, :string, default: "active"
  end
end
