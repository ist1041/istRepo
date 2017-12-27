Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products , :except => [:show,:destroy,:update] do
    collection do
      post 'create'
      post 'update'
    end
    member do
      get 'destroy'
    end

    resources :sales , :except => [:index,:edit,:destroy,:show,:update,:create,:new] do
      collection do
        get '/edit/:month' => 'sales#edit'
        get '/destroy/:month' => 'sales#destroy'
        post 'update'
      end
    end

  end
  resources :sales , :except => [:index,:edit,:destroy,:show,:update] do
    collection do
      post 'create'
    end
  end
end
