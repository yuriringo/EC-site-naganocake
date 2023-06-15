class Item < ApplicationRecord

 validates :name, presence: true
 validates :introduction, presence: true
 validates :price, presence: true
 validates :is_active, presence: true
 belongs_to :genre
 has_many :cart_items
 has_many :order_items
 has_one_attached :image

  #消費税を加えた価格
 def add_tax_price
  (self.price * 1.10).round
 end

 def get_image(width, height)
  unless image.attached?
   file_path = Rails.root.join('app/assets/images/no_image.jpg')
   image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
   image.variant(resize_to_limit: [width, height]).processed
 end


 enum is_active: { for_sale: 0, stop_selling: 1 }

end
