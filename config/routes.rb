Rails.application.routes.draw do
  
  # 会員用
  
  root to: "public/homes#top"
  
  # URL /members/sign_in
  devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'}
  devise_scope :member do
  post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :public do
     get 'my_pages/information/:id', to: "my_pages#show", as: 'my_pages_show'
     get "my_pages" => "my_pages#index"
     patch "my_pages" => "my_pages#update"
     post "my_pages" => "my_pages#create"
     patch 'my_pages/withdraw' => "my_pages#withdraw"
     patch 'my_pages/:id/renew' => "my_pages#renew", as: 'my_pages_renew'
     delete 'my_pages/:id', to: "my_pages#destroy", as: 'my_pages_delete'
     resources :reviews, only:[:create]
     
     resources :discoveries, only: [:index, :show, :create] do
       collection do
         get 'search'
       end
     end

  end
  
  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"}
  
  namespace :admin do

     resources :members, only: [:index, :edit, :update]
     resources :discoveries, only: [:index, :edit, :update]
     resources :reviews, only: [:index, :edit, :update]
     resources :genres, only: [:index, :edit, :create, :update]

  end
  
end
