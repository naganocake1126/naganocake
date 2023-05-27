Rails.application.routes.draw do
  
   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  
  
  
  scope module: :public do
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/sign_up' => 'registrations#new'
    post 'customers' => 'registrations#create'
    get 'customers/mypage' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    
    resources :cart_items
    #resources :customers, only: [:show, :edit]
    resources :orders
  end
  
  namespace :admin do
    get '/admin' => 'homes#top'
    
    resources :items
    resources :customers
    get '/asmin/orders/:id' => 'orders#show'
  end
  
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
