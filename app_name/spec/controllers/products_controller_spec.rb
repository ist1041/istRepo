require 'rails_helper'
require_relative '../../app/controllers/products_controller'

RSpec.describe ProductsController, type: :controller do
  #testデータベース上にinsertしたデータのid
  auto_increment_id = 135

  describe 'Get #index' do
    before do
      get :index
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':indexテンプレートを表示すること' do
      expect(response).to render_template :index
    end
  end
  describe 'Get #new' do
      before do
        get :new
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it ':newテンプレートを表示すること' do
        expect(response).to render_template :new
      end
  end
  describe 'Post #create' do
      let(:product){ 
        post :create , params: { name: 'test', price: 1000 }
      }
      it 'リクエストは302 Foundとなること' do
        expect(product.status).to eq 302
      end
      it '@productsに新規商品を割り当てること' do
        expect{product}.to change(Product, :count).by(1)
      end
      it ':indexにリダイレクトすること' do
        expect(product).to redirect_to action: 'index'
      end
    end
    describe 'Get #edit' do
      #let!(:product){ 
      #  post :create , params: { name: 'test', price: 1000 }
      #}
      before do
        get :edit , params: { id: auto_increment_id }
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it ':editテンプレートを表示すること' do
        expect(response).to render_template :edit
      end
    end

    describe 'Post #update' do
      #let!(:product){ 
      #  post :create , params: { name: 'test', price: 1000 }
      #s}
      it 'リクエストは302 Foundとなること' do
        post :update , params: { id: auto_increment_id ,name: 'test2', price: 2000 }
        expect(response.status).to eq 302
      end
      it '@productsに指定の商品を更新すること' do
        expect{
          post :update , params: { id: auto_increment_id ,name: 'test2', price: 2000 }
        }.to change(Product, :count).by(0)
      end
      it ':indexにリダイレクトすること' do
          post :update , params: { id: auto_increment_id ,name: 'test2', price: 2000 }
          expect(response).to redirect_to action: 'index'
      end
  end
  describe "DELETE #destroy" do
      #let!(:product){ 
      #  post :create , params: { name: 'test', price: 1000 }
      #}
      it 'リクエストは302 Foundとなること' do
        delete :destroy , params: { id: auto_increment_id }
        expect(response.status).to eq 302
      end
      it "該当する商品データが削除される" do
        expect{
          delete :destroy , params: { id: auto_increment_id }
        }.to change(Product, :count).by(-1)
      end
      it ':indexにリダイレクトすること' do
        delete :destroy , params: { id: auto_increment_id }
        expect(response).to redirect_to action: 'index'
      end
  end
end
