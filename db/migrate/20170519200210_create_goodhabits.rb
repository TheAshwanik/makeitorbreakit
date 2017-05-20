class CreateGoodhabits < ActiveRecord::Migration[5.0]
  def change
    create_table :goodhabits do |t|
      t.integer :user_id
      t.string :goodhabit
      t.string :description
      t.integer :timesperweek
      t.boolean :reminders
      t.timestamps
    end
  end
end
