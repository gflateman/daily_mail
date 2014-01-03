class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :body
      t.string :email

      t.timestamps
    end
  end
end
