require 'rails_helper'

RSpec.describe Sale, type: :model do
  it "成功時" do
    sale = Sale.new
    sale.id = 1
    sale.product_id = 1
    sale.month = 1
    sale.num = 1
    sale.created_at = "2017-12-01"
    sale.updated_at = "2017-12-01"
    expect(sale).to be_valid
  end
  it "エラー時：値が空" do
    sale = Sale.new
    sale.id = nil
    sale.product_id = nil
    sale.month = nil
    sale.num = nil
    sale.created_at = nil
    sale.updated_at = nil
    expect(sale).to be_valid
  end
  it "エラー時：型が異る" do
    sale = Sale.new
    sale.id = "a"
    sale.product_id = "a"
    sale.month = "a"
    sale.num = "a"
    sale.created_at = "a"
    sale.updated_at = "a"
    expect(sale).to be_valid
  end
end
