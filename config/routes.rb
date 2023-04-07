Rails.application.routes.draw do
  
  # 会員用
  
  root to: "public/homes#top"
  
  # URL /members/sign_in
  devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :public do
     get "my_page" => "my_page#index"
     patch "my_page" => "my_page#update"
     post "my_page" => "my_page#create"
     patch 'my_page/withdraw' => "my_page#withdraw"
     get 'my_page/information/:id' => "my_page#show"
     patch 'my_page/information' => "my_page#renew"
     delete 'my_page/information/:id' => "my_page#destroy"
  end
  
  namespace :public do
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
  end
  
  namespace :admin do
     get "discoveries" => "discoveries#index"
     get 'discoveries/:id/edit' => "discoveries#edit"
     patch "discoveries/:id" => "discoveries#update"
  end
  
  namespace :admin do
     get "reviews" => "reviews#index"
     get 'reviews/:id/edit' => "reviews#edit"
     patch "reviews/:id" => "reviews#update"
  end
  
  namespace :admin do
     get "genres" => "genres#index"
     post 'genres/:id/edit' => "genres#create"
     patch "genres/:id" => "genres#update"
  end
  
end
