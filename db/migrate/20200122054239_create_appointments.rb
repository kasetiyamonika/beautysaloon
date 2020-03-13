class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :payment_id, limit: 20
      t.string :payment_mode, limit: 30
      t.decimal :price
      t.datetime :start_time
      t.datetime :end_time
      t.string :status, limit: 20
      t.text :remark

      t.timestamps
    end
  end
end
