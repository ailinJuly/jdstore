Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :admin do
   resources :products
 end

namespace :admin do
   resources :orders do
       member do
         post :cancel
         post :ship
         post :shipped
         post :return
       end
     end
 end

  resources :appointments

   resources :products do
      member do
        post :add_to_cart
      end
      put :favorite, on: :member
      resources :posts
   end


   resources :carts do
     collection do
       delete :clean
       post :checkout
     end
   end

resources :orders
resources :cart_items


 resources :favorite

 namespace :account do
   resources :orders
 end
 resources :orders do
   member do
     post :pay_with_alipay
     post :pay_with_wechat
      post :apply_to_cancel
   end
 end

 resources :categories do
	resources :products
end
end
