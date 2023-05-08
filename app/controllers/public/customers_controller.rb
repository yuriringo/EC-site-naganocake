class Public::CustomersController < ApplicationController
  def show
   @customer=current_customer
  end

  def edit
   @customer=current_customer
  end

  def update
   @customer=current_customer
   if @customer.update(customer_params)
    flash[:notice]="登録情報の編集が完了しました。"
    redirect_to customers_path
   else
    render :edit
   end
  end

  def check
  end

  def withdrawal
  end

  private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end