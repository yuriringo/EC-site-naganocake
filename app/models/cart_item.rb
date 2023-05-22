class CartItem < ApplicationRecord
 has_one_attached :image
 belongs_to :item
 belongs_to :customer


 def add_tax_price
  (self.price * 1.10).round
 end

 def sum_of_price
  item.add_tax_price * amount
 end
end
