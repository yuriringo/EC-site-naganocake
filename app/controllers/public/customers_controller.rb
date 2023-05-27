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
   # 退会対象のCustomerを特定
   @customer = current_customer
   # @customerのis_deletedをtrueにする
   @customer.update(is_deleted: true)
   # ログイン情報を破棄
   reset_session
   # topにリダイレクト
   redirect_to root_path
  end

  private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end