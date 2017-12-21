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
    before do
      post :create_product ,FactoryBot.create(:product)
    end
    #it 'リクエストは200 OKとなること' do
    #  expect(response.status).to eq 200
    #end
    it '@productsに新規商品を割り当てること' do
       expect(response).to change(Product, :count).by(1)
    end
    #it ':showにリダイレクトすること' do
    #  expect(response).to redirect_to :show
    #end
  end
  describe 'Get #new_sale' do
    before do
      get :new_sale
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it ':new_saleテン0プレートを表示すること' do
      expect(response).to render_template :new_sale
    end
  end
end