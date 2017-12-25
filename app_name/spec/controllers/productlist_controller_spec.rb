require 'rails_helper'
require_relative '../../app/controllers/productlist_controller'

RSpec.describe ProductlistController, type: :controller do

  describe 'Get #show' do
    before do
      get :show
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':showテンプレートを表示すること' do
      expect(response).to render_template :show
    end
  end
  describe 'Get #new_product' do
    before do
      get :new_product
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':new_productテンプレートを表示すること' do
      expect(response).to render_template :new_product
    end
  end
  describe 'Post #create_product' do
    let!(:product){ 
      post :create_product , params: { product_id: 1, name: 'test', price: 1000 }
    }
    it 'リクエストは302 Foundとなること' do
      expect(response.status).to eq 302
    end
    it '@productsに新規商品を割り当てること' do
      expect{product}.to change(Product, :count).by(0)
    end
    it ':showにリダイレクトすること' do
      expect(product).to redirect_to action: 'show'
    end
  end
  describe 'Get #new_sale' do
    before do
      get :new_sale
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':new_saleテンプレートを表示すること' do
      expect(response).to render_template :new_sale
    end
  end
  describe 'Post #create_sale' do
    let!(:sale){ 
      post :create_sale , params: { product_id: 1, month: 1, num: 1 }
    }
    it 'リクエストは302 Foundとなること' do
      expect(response.status).to eq 302
    end
    it '@productsに新規売上を割り当てること' do
      expect{sale}.to change(Sale, :count).by(0)
    end
    it ':showにリダイレクトすること' do
      expect(sale).to redirect_to action: 'show'
    end
  end
  describe 'Get #edit_product' do
    let!(:product){ 
      post :create_product , params: { product_id: 1, name: 'test', price: 1000 }
    }
    before do
      get :edit_product , params: { product_id: 1}
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':edit_productテンプレートを表示すること' do
      expect(response).to render_template :edit_product
    end
  end
  describe 'Post #update_product' do
    let!(:product){ 
      post :create_product , params: { product_id: 1, name: 'test', price: 1000 }
    }
    it 'リクエストは302 Foundとなること' do
      post :update_product , params: { product_id: 1, name: 'test2', price: 2000 }
      expect(response.status).to eq 302
    end
    it '@productsに指定の商品を更新すること' do
      expect{
        post :update_product , params: { product_id: 1, name: 'test2', price: 2000 }
      }.to change(Product, :count).by(0)
    end
    it ':showにリダイレクトすること' do
        post :update_product , params: { product_id: 1, name: 'test2', price: 2000 }
        expect(response).to redirect_to action: 'show'
    end
  end
  describe 'Get #edit_sale' do
    let!(:sale){ 
      post :create_sale , params: { product_id: 1, month: 1, num: 1 }
    }
    before do
      get :edit_sale , params: { product_id: 1, month: 1}
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':edit_saleテンプレートを表示すること' do
      expect(response).to render_template :edit_sale
    end
  end
  describe 'Post #update_sale' do
    let!(:sale){ 
      post :create_sale , params: { product_id: 1, month: 1, num: 1 }
    }
    it 'リクエストは302 Foundとなること' do
      post :update_sale , params: { product_id: 1, month: 1, num: 2 }
      expect(response.status).to eq 302
    end
    it '@salesに指定の商品の売上を更新すること' do
      expect{
        post :update_sale , params: { product_id: 1, month: 1, num: 2 }
      }.to change(Sale, :count).by(0)
    end
    it ':showにリダイレクトすること' do
        post :update_sale , params: { product_id: 1, month: 1, num: 2 }
        expect(response).to redirect_to action: 'show'
    end
  end
  describe "DELETE #destroy_product" do
    let!(:product){ 
      post :create_product , params: { product_id: 1, name: 'test', price: 1000 }
    }
    it 'リクエストは302 Foundとなること' do
      delete :destroy_product , params: {product_id: 1}
      expect(response.status).to eq 302
    end
    it "該当する商品データが削除される" do
      expect{
        delete :destroy_product , params: {product_id: 1}
      }.to change(Product, :count).by(-1)
    end
    it ':showにリダイレクトすること' do
      delete :destroy_product, params: {product_id: 1}
      expect(response).to redirect_to action: 'show'
    end
  end

  describe "DELETE #destroy_sale" do
    let!(:sale){ 
      post :create_sale , params: { product_id: 1, month: 1, num: 1 } 
    }
    it 'リクエストは302 Foundとなること' do
      delete :destroy_sale, params: {product_id: 1, month: 1}
      expect(response.status).to eq 302
    end
    it "該当する売上データが削除される" do
      expect{
        delete :destroy_sale, params: {product_id: 1, month: 1}
      }.to change(Sale, :count).by(-1)
    end
    it ':showにリダイレクトすること' do
      delete :destroy_sale, params: {product_id: 1, month: 1}
      expect(response).to redirect_to action: 'show'
    end
  end
end