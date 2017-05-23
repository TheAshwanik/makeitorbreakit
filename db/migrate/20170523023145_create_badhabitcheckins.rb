class CreateBadhabitcheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :badhabitcheckins do |t|
      t.integer :user_id
      t.integer :badhabit_id
      t.datetime :checkintime
      t.text :status
      t.timestamps
    end
  end
end
