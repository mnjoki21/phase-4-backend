class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :amount
      t.string :start_date
      t.string :billing_cycle
      t.integer :provider_id
      t.integer :category_id


      t.timestamps
    end
  end
end
