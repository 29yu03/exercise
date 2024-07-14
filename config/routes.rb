Rails.application.routes.draw do

  namespace :public do
    get 'search/index'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :communities, only: [:index, :edit, :create, :update]
    resources :posts, only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :create, :update]
    resources :topics, only: [:index, :edit, :create, :update]
    get '/', to: 'homes#top', as: :top
  end


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    resources :communities, except: [:destroy] do
      resources :topics, only: [:index, :show, :edit, :create, :update]
      resource :group_users, only: [:create, :destroy]
    end
    resources :posts, only: [:index, :show, :edit, :create, :update]
    resources :users, only: [:show, :edit, :update, :destroy]
     # 検索
    get 'search', to: 'search#index', as: :search

  end


  root 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
