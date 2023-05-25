class Address < ApplicationRecord

 belongs_to :customer
 validates :name, presence: true
 validates :postal_code, presence: true
 validates :delivery_address, presence: true

 def address_display
  '〒' + postal_code + ' ' + delivery_address + ' ' + name
 end

end
