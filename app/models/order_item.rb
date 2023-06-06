class OrderItem < ApplicationRecord
 belongs_to :order
 belongs_to :item

 enum confectionary_status: { not_product: 0, product_wait: 1, producting: 2, completed: 3 }

 def sum_of_price
  item.add_tax_price * amount
 end

end
