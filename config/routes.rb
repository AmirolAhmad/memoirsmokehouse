Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
  devise_scope :user do
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end
  resources :orders, only: [:new, :create, :show]
  root 'homepage#index'
  namespace :admin, path: '/master' do
    get "/" => "dashboard#index", as: 'master'
    resources :menus, except: [:show, :destroy]
  end
end
