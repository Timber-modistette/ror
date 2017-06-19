class UsersController < ApplicationController
  before_action :user_authorized, only:[:dashboard]
  def register

  end
  def create
    user = User.create(register_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard/#{session[:user_id]}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end
  def dashboard
    @current_user = current_user
    @user = User.find(params[:id])
    @products_bought = current_user.buys
    @products_sold = Buy.where(product:current_user.product_ids)
    @not_sold = current_user.products.where.not(id:Buy.where(product: current_user.product_ids).pluck('product_id'))
  
  end
  private
  def register_params
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end
end