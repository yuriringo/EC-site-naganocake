class Admin::HomesController < ApplicationController
  def top
   @customer=Customer.all
   @customer.order_items=OrderItem.all
  end
end
