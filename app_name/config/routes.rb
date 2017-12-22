Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :productlist , :except => [:index,:create,:new,:edit,:update,:destroy,:show] do
    collection do
      get 'show'
      get 'new_product'
      post 'create_product'
      get 'new_sale'
      post 'create_sale'
      get 'edit_product/:product_id' => 'productlist#edit_product'
      post 'update_product'
      get 'edit_sale/:product_id/:month' => 'productlist#edit_sale'
      post 'update_sale'
      get 'destroy_product/:product_id' => 'productlist#destroy_product'
      get 'destroy_sale/:product_id/:month' => 'productlist#destroy_sale'
    end
  end
end
