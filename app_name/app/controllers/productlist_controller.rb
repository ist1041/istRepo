
class ProductlistController < ApplicationController
  def index
    # @products = Product.joins("JOIN sales ON products.product_id = sales.product_id").order(:product_id).select('products.*,sales.month,sales.num').all
    @products = Product.order(:product_id).all
    @sales = Sale.order(:month).all
  end
end
