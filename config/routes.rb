Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
    }
  scope module: :public do
    root to: 'homes#top'
    get '/customers' => 'public/customers#show'
    get '/customers/edit' => 'public/customers#edit'
    patch '/customers' => 'public/customers#update'
    get '/customers/withdraw' => 'public/customers#withdraw'
    patch '/customers' => 'public/customers#update'
    get '/shipping_addresses' => 'public/shipping_addresses#index'
    post '/shipping_addresses' => 'public/shipping_addresses#create'
    get '/shipping_addresses/:id/edit' => 'public/shipping_addresses#edit'
    delete '/shipping_addresses/:id' => 'public/shipping_addresses#destroy'
    patch '/shipping_addresses/:id' => 'public/shipping_addresses#update'
    get '/items' => 'public/items#index'
    get '/items/:id' => 'public/items#show'
    get '/cart_items' => 'public/cart_items#index'
    delete '/cart_items' => 'public/cart_items#destroy_all'
    delete '/cart_items/:id' => 'public/cart_items#destroy'
    post '/cart_items' => 'public/cart_items#create'
    patch '/cart_items/:id' => 'public/cart_items#update'
    get '/orders' => 'public/orders#index'
    get '/orders/:id' => 'public/orders#show'
    get '/orders/new' => 'public/orders#new'
    get '/orders/confirm' => 'public/orders#confirm'
    post '/orders' => 'public/orders#create'
    get '/orders/thanks' => 'public/orders#thanks'
  end

  namespace :admin do
    root to: 'homes#top'
    get '/admin/customers' => 'admin/customers#index'
    get '/admin/customers/:id' => 'admin/customers#show'
    get '/admin/customers/:id/edit' => 'admin/customers#edit'
    patch '/admin/customers/:id' => 'admin/customers#update'
    get '/admin/items' => 'admin/items#index'
    get '/admin/items/:id' => 'admin/items#show'
    get '/admin/items/new' => 'admin/items#new'
    post '/admin/items' => 'admin/items#create'
    get '/admin/items/:id/edit' => 'admin/items#edit'
    patch '/admin/items/:id' => 'admin/items#update'
    get '/admin/genres' => 'admin/genres#index'
    post '/admin/genres' => 'admin/genres#create'
    get '/admin/genres/:id/edit' => 'admin/genres#edit'
    patch '/admin/genres/:id' => 'admin/genres#update'
    get '/admin/orders' => 'admin/orders#index'
    get '/admin/orders/:id' => 'admin/orders#show'
    patch '/admin/orders/:id' => 'admin/orders#update'
    patch '/admin/orders/:order_id/order_items/:id' => 'admin/order_items#update'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
