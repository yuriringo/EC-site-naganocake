class OrderItem < ApplicationRecord
 belongs_to :order
 belongs_to :item

 def sum_of_price
  item.add_tax_price * amount
 end

end
