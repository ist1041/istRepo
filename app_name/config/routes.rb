Rails.application.routes.draw do
  get 'productlist/show'
  get 'productlist/new_product'
  post 'productlist/create_product'
  get 'productlist/new_sale'
  post 'productlist/create_sale'
  get 'productlist/edit_product/:product_id' => 'productlist#edit_product'
  post 'productlist/update_product'
  get 'productlist/edit_sale/:product_id/:month' => 'productlist#edit_sale'
  post 'productlist/update_sale'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
