class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :provider
      t.string :category
      t.string :subscription

      t.timestamps
    end
  end
end
