require 'rails_helper'
require_relative '../../app/controllers/sales_controller'

RSpec.describe SalesController, type: :controller do
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
        let(:sale){ 
          post :create , params: { product_id: 1, month: 1, num: 1 }
        }
        it 'リクエストは302 Foundとなること' do
          expect(sale.status).to eq 302
        end
        it '@productsに新規売上を割り当てること' do
          expect{sale}.to change(Sale, :count).by(1)
        end
        it ':showにリダイレクトすること' do
          expect(sale).to redirect_to '/products/'
        end
    end
    describe 'Get #edit' do
        let!(:sale){ 
          post :create , params: { product_id: 1, month: 1, num: 1 }
        }
        before do
          get :edit , params: { product_id: 1, month: 1}
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        it ':editテンプレートを表示すること' do
          expect(response).to render_template :edit
        end
    end
    describe 'Post #update' do
        let!(:sale){ 
          post :create , params: { product_id: 1, month: 1, num: 1 }
        }
        it 'リクエストは302 Foundとなること' do
          post :update , params: { product_id: 1, month: 1, num: 2 }
          expect(response.status).to eq 302
        end
        it '@salesに指定の商品の売上を更新すること' do
          expect{
            post :update , params: { product_id: 1, month: 1, num: 2 }
          }.to change(Sale, :count).by(0)
        end
        it ':showにリダイレクトすること' do
            post :update , params: { product_id: 1, month: 1, num: 2 }
            expect(response).to redirect_to '/products/'
        end
    end
    describe "DELETE #destroy" do
        let!(:sale){ 
          post :create , params: { product_id: 1, month: 1, num: 1 } 
        }
        it 'リクエストは302 Foundとなること' do
          delete :destroy, params: {product_id: 1, month: 1}
          expect(response.status).to eq 302
        end
        it "該当する売上データが削除される" do
          expect{
            delete :destroy, params: {product_id: 1, month: 1}
          }.to change(Sale, :count).by(-1)
        end
        it ':showにリダイレクトすること' do
          delete :destroy, params: {product_id: 1, month: 1}
          expect(response).to redirect_to '/products/'
        end
    end
end
