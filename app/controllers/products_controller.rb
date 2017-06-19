class ProductsController < ApplicationController
  before_action :user_authorized
  def index
    @products = Product.all
    @user_bought = current_user.products_bought.pluck(:id)
  end
  def create
    product = Product.create(product_params.merge(user:User.find(product_params[:user])))
    redirect_to :back, notice:'successfully created product to sell'
  end
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to :back
  end
  private
  def product_params
    params.require(:product).permit(:name, :amount, :user)
  end
end
