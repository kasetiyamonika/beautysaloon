class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :payment_id, limit: 20
      t.string :payment_mode, limit: 30
      t.datetime :date_time
      t.decimal :total
      t.string :status, limit: 20

      t.timestamps
    end
  end
end
