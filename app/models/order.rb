class Order < ApplicationRecord

 belongs_to :customer
 has_many :order_items, dependent: :destroy
 has_many :items, through: :order_items

 enum payment_method: { credit_card: 0, transfer: 1 }

 enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, producting: 2, shipping_preparation: 3, sent: 4 }
 #def add_tax_price
  #(self.price * 1.10).round
 #end

 #def sum_of_price
  #item.add_tax_price * amount
 #end

end
