class Admin::CustomersController < ApplicationController
  def index
   @customers=Customer.all
  end

  def show
   @customer=Customer.find(params[:id])
  end

  def edit
   @customer=Customer.find(params[:id])
  end

  def update
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
end