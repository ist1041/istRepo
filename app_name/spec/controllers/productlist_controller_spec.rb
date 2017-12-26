require 'rails_helper'
require_relative '../../app/controllers/productlist_controller'

RSpec.describe ProductlistController, type: :controller do

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
end