Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: 'admin/sessions'
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}

  scope module: :public do
   resources :items, only: [:index, :show]
   resources :customers, only: [:show, :edit, :update]
   resources :cart_items, only: [:index, :update, :destroy, :create]
   resources :orders, only: [:new, :create, :index, :show]
   resources :addresses, only: [:index, :edit, :create, :update, :destroy]

   get '/' => 'homes#top'
   get '/about' => 'homes#about'
   get '/customers/check' => 'customers#check'
   patch '/customers/withdrawal' => 'customers#withdrawal'
   delete '/cart items/delete_all' => 'cart_items#delete_all'
   post '/orders/check' => 'orders#check'
   get '/orders/complete' => 'orders#complete'
  end

  namespace :admin do
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]

   post 'genres' => 'genres#create'
   get 'genres' => 'genres#index'
  end

  scope module: :admin do
   get '/admin' => 'homes#top'
  end

end
