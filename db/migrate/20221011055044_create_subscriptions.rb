class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :provider
      t.string :category
      t.integer :amount
      t.string :start_date
      t.string :billing_cycle

      t.timestamps
    end
  end
end
