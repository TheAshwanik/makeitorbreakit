class CreateGoalcheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :goalcheckins do |t|
      t.integer :user_id
      t.integer :goodhabit_id
      t.datetime :checkintime
      t.text :status
      t.timestamps
    end
  end
end
