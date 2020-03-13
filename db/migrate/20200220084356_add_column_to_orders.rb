class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :shipping_address ,:text
  end
end
