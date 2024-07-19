Rails.application.routes.draw do

  namespace :public do
    get 'search/index'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :communities, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :topics, only: [:show, :edit, :create, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
      resource :permits, only: [:index, :create, :destroy]
      resource :group_users, only: [:create, :destroy]

    end
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :create, :update, :destroy]
    get '/', to: 'homes#top', as: :top
    get "communities/:id/member" => "communities#member", as: :member
    get "communities/:id/permits" => "communities#permits", as: :permits
  end


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    resources :communities, except: [:destroy] do
      resources :topics, only: [:show, :edit, :create, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
      resource :permits, only: [:index, :create, :destroy]
      resource :group_users, only: [:create, :destroy]
    end
    resources :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :destroy]
     # 検索
    get 'search', to: 'search#index', as: :search
    get "communities/:id/permits" => "communities#permits", as: :permits
    get "communities/:id/member" => "communities#member", as: :member
  end


  root 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
