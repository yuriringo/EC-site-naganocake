class Public::AddressesController < ApplicationController
  def index
   @customer=current_customer
   @address=Address.new
   @addresses=Address.all
  end

  def edit
   @address=Address.find(params[:id])
   @address.customer_id=current_customer.id
  end

  def create
   @customer=current_customer
   @address=Address.new(address_params)
   @address.customer_id=current_customer.id
   @address.save
   redirect_to addresses_path
  end

  def update
   @address=Address.find(params[:id])
   @address.update(address_params)
   redirect_to addresses_path
  end

  def destroy
   @address=Address.find(params[:id])
   @address.destroy
   redirect_to addresses_path
  end

  def address_params
   params.require(:address).permit(:postal_code, :delivery_address, :name)
  end
end
