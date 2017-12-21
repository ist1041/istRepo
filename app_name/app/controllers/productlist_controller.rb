
class ProductlistController < ApplicationController
  protect_from_forgery except: %i[create_product create_sale]
  def show
    # @products = Product.joins("JOIN sales ON products.product_id = sales.product_id").order(:product_id).select('products.*,sales.month,sales.num').all
    @products = Product.order(:product_id).all
    @sales = Sale.order(:month).all
  end

  def new_product
    @products = Product.new
  end

  def create_product
    @products = Product.new(product_id: params[:product_id], name: params[:name], price: params[:price])
    if @products.save
      redirect_to action: 'show'
    else
      render plain: "新規登録失敗#{@products.errors.messages}"
    end
  end

  def new_sale
    @sales = Sale.new
  end

  def create_sale
    @sales = Sale.new(product_id: params[:product_id], month: params[:month], num: params[:num])
    if @sales.save
      redirect_to action: 'show'
    else
      render plain: "新規登録失敗#{@sales.errors.messages}"
    end
  end

  def edit_product
    @products = Product.find_by(product_id: params[:product_id])
  end

  def update_product
    @products = Product.find_by(product_id: params[:product_id])
    if @products.update_attributes(product_id: params[:product_id], name: params[:name], price: params[:price])
      redirect_to action: 'show'
    else
      render plain: "更新失敗#{@products.errors.messages}:#{params[:product_id]}"
    end
  end

  def edit_sale
    @sales = Sale.find_by(product_id: params[:product_id], month: params[:month])
  end

  def update_sale
    @sales = Sale.find_by(product_id: params[:product_id], month: params[:month])
    if @sales.update_attributes(product_id: params[:product_id], month: params[:month], num: params[:num])
      redirect_to action: 'show'
    else
      render plain: "更新失敗#{@sales.errors.messages}:#{params[:product_id]} #{params[:product_id]}月"
    end
  end

  def destroy_product
    @products = Product.find_by(product_id: params[:product_id])
    if @products.destroy
      cnt = Sale.where(product_id: params[:product_id]).count
      if cnt > 0
        @sales = Sale.where(product_id: params[:product_id]).all
        if @sales.destroy_all
        else
          render plain: "売上一括削除失敗#{@sales.errors.messages}:#{params[:product_id]}"
        end
      end
      redirect_to action: 'show'
    else
      render plain: "商品削除失敗#{@products.errors.messages}:#{params[:product_id]}"
    end
  end

  def destroy_sale
    @sales = Sale.find_by(product_id: params[:product_id], month: params[:month])
    if @sales.destroy
      redirect_to action: 'show'
    else
      render plain: "削除失敗#{@sales.errors.messages}:#{params[:product_id]} #{params[:product_id]}月"
    end
  end
end
