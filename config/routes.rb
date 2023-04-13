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
     get "my_pages" => "my_pages#index"
     patch "my_pages" => "my_pages#update"
     post "my_pages" => "my_pages#create"
     patch 'my_pages/withdraw' => "my_pages#withdraw"
     get 'my_pages/information/:id' => "my_pages#show"
     patch 'my_pages/information' => "my_pages#renew"
     delete 'my_pages/information/:id' => "my_pages#destroy"
     
     get "discoveries" => "discoveries#index"
     get 'discoveries/:id' => "discoveries#show"
     post "discoveries" => "discoveries#create"

  end
  
  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"}
  
  namespace :admin do
     get "members" => "members#index"
     get 'members/:id/edit' => "members#edit"
     patch "members/:id" => "members#update"

     get "discoveries" => "discoveries#index"
     get 'discoveries/:id/edit' => "discoveries#edit"
     patch "discoveries/:id" => "discoveries#update"

     get "reviews" => "reviews#index"
     get 'reviews/:id/edit' => "reviews#edit"
     patch "reviews/:id" => "reviews#update"

     get "genres" => "genres#index"
     post 'genres/:id/edit' => "genres#create"
     patch "genres/:id" => "genres#update"
  end
  
end
