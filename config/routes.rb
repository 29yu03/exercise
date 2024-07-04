Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :communities, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :users, only: [:index, :show, :edit]
    get '/', to: 'homes#top', as: :top
  end


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    resources :communities, only: [:index, :show, :edit]
    resources :posts, only: [:index, :show, :edit, :create, :update]
    resources :users, only: [:show, :edit, :update]
  end


  root 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
