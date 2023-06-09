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
   resource :customers, only: [:show]
   resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
     delete "delete_all"
     end
    end
   post '/orders/check' => 'orders#check'
   get '/orders/complete' => 'orders#complete'

   resources :orders, only: [:new, :create, :index, :show]
   resources :addresses, only: [:index, :edit, :create, :update, :destroy]

   root to: 'homes#top'
   get '/about' => 'homes#about'
   get '/customers/check' => 'customers#check'
   get 'customers/mypage/edit' => 'customers#edit'
   patch 'customers/mypage' => 'customers#update'

   patch '/customers/withdrawal' => 'customers#withdrawal'
   #delete '/cart_items/delete_all' => 'cart_items#delete_all'
   #delete '/addresses/:id' => 'addresses#destroy'

  end

  namespace :admin do
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]

#   post 'genres' => 'genres#create'
#   get 'genres' => 'genres#index'
#   patch 'genres/:id' => 'genres#update'

  end

  scope module: :admin do
   get '/admin' => 'homes#top'
  end

end
