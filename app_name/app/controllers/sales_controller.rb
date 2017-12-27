class SalesController < ApplicationController
    protect_from_forgery except: %i[create]
    def new
        @sales = Sale.new
    end

    def create
        @sales = Sale.new(product_id: params[:product_id], month: params[:month], num: params[:num])
    if @sales.save
        redirect_to '/products/'
    else
        render plain: "新規登録失敗#{@sales.errors.messages}"
    end
    end

    def edit
        @sales = Sale.find_by(product_id: params[:product_id], month: params[:month])
    end

    def update
        @sales = Sale.find_by(product_id: params[:product_id], month: params[:month])
        if @sales.update_attributes(product_id: params[:product_id], month: params[:month], num: params[:num])
            redirect_to '/products/'
        else
            render plain: "更新失敗#{@sales.errors.messages}:#{params[:product_id]} #{params[:product_id]}月"
        end
    end
    def destroy
        @sales = Sale.find_by(product_id: params[:product_id], month: params[:month])
        if @sales.destroy
            redirect_to '/products/'
        else
            render plain: "削除失敗#{@sales.errors.messages}:#{params[:product_id]} #{params[:product_id]}月"
        end
    end
end
