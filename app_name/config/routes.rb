Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'productlist' => 'productlist#index'
  resources :products , :except => [:index,:edit,:destroy,:show] do
    collection do
      post 'create'
      get 'edit/:product_id' => 'products#edit'
      post 'update'
      get 'destroy/:product_id' => 'products#destroy'
    end
  end
  resources :sales , :except => [:index,:edit,:destroy,:show] do
    collection do
      post 'create'
      get 'edit/:product_id/:month' => 'sales#edit'
      post 'update'
      get 'destroy/:product_id/:month' => 'sales#destroy'
    end
  end
end
