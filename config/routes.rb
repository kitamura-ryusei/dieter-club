Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/registrations"
  }
  
  scope module: :public do
  root to: "homes#top"
  
    resources :posts, only: [:new, :index, :show, :destroy, :create, :edit, :update]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/informaiton' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :comments, only: [:create]
    # resources :favorites, only: [:create, :destroy]
  end
  
  namespace :admin do
    root to: "homes#top"
    # resources :genres, except: [:new, :show, :destory]
    # resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
