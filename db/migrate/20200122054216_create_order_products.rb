class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :price
      t.decimal :discount
      t.string :discount_type, limit: 3
      t.decimal :total

      t.timestamps
    end
  end
end
