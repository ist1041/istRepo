
class ProductlistController < ApplicationController
  protect_from_forgery :except => [:create_product,:create_sale]
  def show
    @products = Product.all
  end
  def new_product 
    @products = Product.new
  end
  def create_product
    @products = Product.new(:product_id => params[:product_id],:name => params[:name],:price => params[:price])
    if @products.save
      redirect_to :action => 'show'
    else
      render plain: "新規登録失敗#{@products.errorsi.messages}"
    end
  end
  def new_sale
    @sales = Sale.new
  end
  def create_sale
    @sales = Sale.new(:product_id => params[:product_id],:month => params[:month],:num => params[:num])
    if @sales.save
      redirect_to :action => 'show'
    else
      render plain: "新規登録失敗#{@sales.errors.messages}"
    end
  end
  def edit_product
    @products = Product.find(params[:product_id])
  end
  def update_product
    @products = Product.find(params[:product_id])
    if @products.update_attributes(:product_id => params[:product_id],:name => params[:name],:price => params[:price])
      redirect_to :action => 'show'
    else
      render plain: "更新失敗#{@products.errorsi.messages}:#{params[:product_id]}"
    end
  end
end

