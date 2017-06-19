class BuyersController < ApplicationController
  before_action :user_authorized
  def create
    buy = Buy.create(buy_params.merge(user: User.find(buy_params[:user]), product: Product.find(buy_params[:product])))
    redirect_to "/dashboard/#{session[:user_id]}"
  end
  private
  def buy_params
    params.require(:buy).permit(:user,:product)
  end
end
