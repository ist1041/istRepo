require 'rails_helper'
require_relative '../../app/controllers/products_controller'

RSpec.describe ProductsController, type: :controller do
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
          post :create , params: { product_id: 1, name: 'test', price: 1000 }
        }
        it 'リクエストは302 Foundとなること' do
          expect(product.status).to eq 302
        end
        it '@productsに新規商品を割り当てること' do
          expect{product}.to change(Product, :count).by(1)
        end
        it ':showにリダイレクトすること' do
          expect(product).to redirect_to '/productlist/'
        end
      end
      describe 'Get #edit' do
        let!(:product){ 
          post :create , params: { product_id: 1, name: 'test', price: 1000 }
        }
        before do
          get :edit , params: { product_id: 1}
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        it ':editテンプレートを表示すること' do
          expect(response).to render_template :edit
        end
      end
      describe 'Post #update' do
        let!(:product){ 
          post :create , params: { product_id: 1, name: 'test', price: 1000 }
        }
        it 'リクエストは302 Foundとなること' do
          post :update , params: { product_id: 1, name: 'test2', price: 2000 }
          expect(response.status).to eq 302
        end
        it '@productsに指定の商品を更新すること' do
          expect{
            post :update , params: { product_id: 1, name: 'test2', price: 2000 }
          }.to change(Product, :count).by(0)
        end
        it ':showにリダイレクトすること' do
            post :update , params: { product_id: 1, name: 'test2', price: 2000 }
            expect(response).to redirect_to '/productlist/'
        end
    end
    describe "DELETE #destroy" do
        let!(:product){ 
          post :create , params: { product_id: 1, name: 'test', price: 1000 }
        }
        it 'リクエストは302 Foundとなること' do
          delete :destroy , params: {product_id: 1}
          expect(response.status).to eq 302
        end
        it "該当する商品データが削除される" do
          expect{
            delete :destroy , params: {product_id: 1}
          }.to change(Product, :count).by(-1)
        end
        it ':showにリダイレクトすること' do
          delete :destroy, params: {product_id: 1}
          expect(response).to redirect_to '/productlist/'
        end
    end
end
