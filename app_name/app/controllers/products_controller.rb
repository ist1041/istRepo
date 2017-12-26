class ProductsController < ApplicationController
    protect_from_forgery except: %i[create]
    def product
        @products = Product.new
    end

    def create
        @products = Product.new(product_id: params[:product_id], name: params[:name], price: params[:price])
        if @products.save
            redirect_to '/productlist/'
        else
            render plain: "新規登録失敗#{@products.errors.messages}"
        end
    end

    def edit
        @products = Product.find_by(product_id: params[:product_id])
    end
    
    def update
        @products = Product.find_by(product_id: params[:product_id])
        if @products.update_attributes(product_id: params[:product_id], name: params[:name], price: params[:price])
          redirect_to '/productlist/'
        else
          render plain: "更新失敗#{@products.errors.messages}:#{params[:product_id]}"
        end
    end

    def destroy
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
          redirect_to '/productlist/'
        else
          render plain: "商品削除失敗#{@products.errors.messages}:#{params[:product_id]}"
        end
      end
end
