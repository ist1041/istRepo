class ProductsController < ApplicationController
    protect_from_forgery except: %i[create]
    def index
        # @products = Product.joins("JOIN sales ON products.product_id = sales.product_id").order(:product_id).select('products.*,sales.month,sales.num').all
        @products = Product.all
      end
    def product
        @products = Product.new
    end

    def create
        @products = Product.new(name: params[:name], price: params[:price])
        if @products.save
            redirect_to action: 'index'
        else
            render plain: "新規登録失敗#{@products.errors.messages}"
        end
    end

    def edit
        @products = Product.find(params[:id])
    end
    
    def update
        @products = Product.find(params[:id])
        if @products.update(id: params[:id], name: params[:name], price: params[:price])
          redirect_to action: 'index'
        else
          render plain: "更新失敗#{@products.errors.messages}:#{params[:product_id]}"
        end
    end

    def destroy
        @products = Product.find(params[:id])
        if @products.destroy
            cnt = Sale.where(product_id: params[:id]).count
            if cnt > 0
                @sales = Sale.where(product_id: params[:id]).all
                if @sales.destroy_all
                    redirect_to action: 'index'
                else
                    render plain: "売上一括削除失敗#{@sales.errors.messages}:#{params[:product_id]}"
                end
            else
                redirect_to action: 'index'
            end
        else
            render plain: "商品削除失敗#{@products.errors.messages}:#{params[:product_id]}"
        end
    end
end
