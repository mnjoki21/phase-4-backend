class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :name
      t.string :status
      t.string :due_date
      t.integer :user_id
      t.integer :subscription_id
   

      t.timestamps
    end
  end
end
