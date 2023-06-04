Rails.application.routes.draw do

   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }




  scope module: :public do
    # get 'items' => 'items#index'
    # get 'items/:id' => 'items#show'
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/sign_up' => 'registrations#new'
    post '/customers' => 'registrations#create'
    get 'customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit', as: 'edit_customers'
    patch '/customers/information/:id' => 'customers#update', as: 'update_customers'
    get '/customers/quit' => 'customers#quit'
    patch '/customers/leave' => 'customers#leave'
    delete '/cart_items/:id' => 'cart_items#destroy'
    delete '/cart_items/all_destroy' => 'cart_items#all_destroy', as: 'all_destroy_cart_items'
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:destroy, :create, :index, :update]
    resources :orders
  end

  namespace :admin do
    get '/admin' => 'homes#top'
    # get '/admin/items' => 'items#new'
    # post '/admin/items' => 'admin#create'
    # get '/admin/items/:id' => 'admin#show'
    # get '/admin/items/:id/edit' => 'admin#edit'

    resources :items, only:[:new, :show, :create, :index, :edit, :update]
    resources :cart_item, only:[:index, :create, :destroy]
    resources :customers, only:[:show, :index, :edit, :update]
    get '/asmin/orders/:id' => 'orders#show'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
