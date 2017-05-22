class CreateBadhabits < ActiveRecord::Migration[5.0]
  def change
    create_table :badhabits do |t|
      t.integer :user_id
      t.string :badhabit
      t.string :description
      t.integer :totalnumofdays
      t.boolean :reminders
      t.timestamps
    end
  end
end
