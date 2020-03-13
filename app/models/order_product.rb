class OrderProduct < ApplicationRecord
    validates :price, :total, presence: true

    belongs_to :product
    belongs_to :order

   before_validation :set_values
   after_save :set_order_total

   def set_values
     return if product.blank?

     self.price = product.mrp
     self.discount = product.discount
     self.discount_type = product.discount_type
     self.total = product.mrp
   end

   def set_order_total
     order.update(total: order.order_products.sum(:total))
   end
end
