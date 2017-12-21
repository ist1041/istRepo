require 'rails_helper'

RSpec.describe Product, type: :model do
  it "正常時" do
    product = Product.new
    product.id = 1
    product.product_id = 1
    product.name = "test1"
    product.price = 1000
    product.created_at = "2017-12-01"
    product.updated_at = "2017-12-01"
    expect(product).to be_valid
  end
  it "エラー時：値が空" do
    product = Product.new
    product.id = nil
    product.product_id = nil
    product.name = nil
    product.price = nil
    product.created_at = nil
    product.updated_at = nil
    expect(product).to be_valid
  end
  it "エラー時：型が異る" do
    product = Product.new
    product.id = "a"
    product.product_id = "a"
    product.name = 1
    product.price = "a"
    product.created_at = "a"
    product.updated_at = "a"
    expect(product).to be_valid
  end
  it "エラー時：product_idが重複" do
    product = Product.new
    product.id = 1
    product.product_id = 1
    product.name = "test1"
    product.price = 1000
    product.created_at = "2017-12-01"
    product.updated_at = "2017-12-01"
    product.id = 2
    product.product_id = 1
    product.name = "test2"
    product.price = 2000
    product.created_at = "2017-12-01"
    product.updated_at = "2017-12-01"
    expect(product).to be_valid
  end
end
