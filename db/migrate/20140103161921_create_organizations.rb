class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :address
      t.text :recipient_emails, array: true, default: []
      t.text :member_emails, array: true, default: []
      t.timestamps
    end
    add_index  :organizations, :recipient_emails, using: 'gin'
    add_index  :organizations, :member_emails, using: 'gin'
  end
end
