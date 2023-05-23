class Public::OrdersController < ApplicationController
  def new
   @addresses=Address.where(customer_id: current_customer.id)
   @customer=current_customer
   @order=Order.new
  end

  def check
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
